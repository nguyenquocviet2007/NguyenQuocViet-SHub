import express from 'express'
import DataStructureAndAlgorithmController from '../../controllers/dsa.controller'
const router = express.Router()


const dsa = new DataStructureAndAlgorithmController()

router.get('', dsa.fetchData)
router.post('', dsa.posData)

export default router