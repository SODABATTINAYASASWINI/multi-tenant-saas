const jwt = require("jsonwebtoken");
const bcrypt = require("bcrypt");
const db = require("../config/db");
const auditLogger = require("../utils/auditLogger");

exports.login = async (req, res, next) => {
  const { email, password, tenantSubdomain, tenantId } = req.body;

  try {
    let tenant;

    if (tenantSubdomain) {
      const tRes = await db.query(
        `SELECT * FROM tenants WHERE subdomain = $1`,
        [tenantSubdomain]
      );
      if (tRes.rowCount === 0) {
        return res.status(404).json({ message: "Tenant not found" });
      }
      tenant = tRes.rows[0];
    } else if (tenantId) {
      const tRes = await db.query(
        `SELECT * FROM tenants WHERE id = $1`,
        [tenantId]
      );
      if (tRes.rowCount === 0) {
        return res.status(404).json({ message: "Tenant not found" });
      }
      tenant = tRes.rows[0];
    } else {
      return res.status(400).json({ message: "tenantSubdomain or tenantId required" });
    }

    const userRes = await db.query(
      `SELECT id, email, full_name, password_hash, role, is_active
       FROM users
       WHERE email = $1 AND tenant_id = $2`,
      [email, tenant.id]
    );

    if (userRes.rowCount === 0) {
      return res.status(401).json({ message: "Invalid credentials" });
    }

    const user = userRes.rows[0];

    if (!user.is_active || tenant.status !== "active") {
      return res.status(403).json({ message: "Account suspended or inactive" });
    }

    const isMatch = await bcrypt.compare(password, user.password_hash);
    if (!isMatch) {
      return res.status(401).json({ message: "Invalid credentials" });
    }

    const token = jwt.sign(
      {
        userId: user.id,
        tenantId: tenant.id,
        role: user.role,
      },
      process.env.JWT_SECRET,
      { expiresIn: "24h" }
    );

    await auditLogger({
      tenantId: tenant.id,
      userId: user.id,
      action: "LOGIN",
      entityType: "user",
      entityId: user.id,
      ip: req.ip,
    });

    res.status(200).json({
      success: true,
      data: {
        user: {
          id: user.id,
          email: user.email,
          fullName: user.full_name,
          role: user.role,
          tenantId: tenant.id,
        },
        token,
        expiresIn: 86400,
      },
    });
  } catch (err) {
    next(err);
  }
};
