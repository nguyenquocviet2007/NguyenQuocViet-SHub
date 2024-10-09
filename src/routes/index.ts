import express from 'express'
import upLoadFileRoutes from './uploadFile'
import dsaFileRoutes from './dsa'
const router = express.Router()

router.use('/v1/api/upload', upLoadFileRoutes)
router.use('/v1/api/dsa', dsaFileRoutes)

module.exports = router