const router = require('express').Router();
const mainController = require('../controllers/mainController');

router.post('/', mainController.create);

module.exports = router;