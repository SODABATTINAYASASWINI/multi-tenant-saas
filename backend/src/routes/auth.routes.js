const { body } = require("express-validator");
const validate = require("../middleware/validate.middleware");
const { login } = require("../controllers/auth.controller");

router.post(
  "/login",
  [
    body("email").isEmail(),
    body("password").notEmpty(),
  ],
  validate,
  login
);
