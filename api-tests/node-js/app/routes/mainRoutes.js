const router         = require('express').Router();
const mainController = require('../controllers/mainController');

router.post('/', mainController.createNode);
router.get('/', mainController.findAllNodes);
router.get('/:id', mainController.findOneNode);
router.put('/:id', mainController.updateNode);
router.delete('/', mainController.deleteAllNodes);
router.delete('/:id', mainController.deleteNode);

module.exports = router;