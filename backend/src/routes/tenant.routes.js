const express = require("express");
const auth = require("../middleware/auth.middleware");
const tenantIsolation = require("../middleware/tenant.middleware");
const role = require("../middleware/role.middleware");

const router = express.Router();

router.get(
  "/",
  auth,
  role("super_admin"),
  (req, res) => {
    res.json({ message: "Tenant list" });
  }
);

module.exports = router;
