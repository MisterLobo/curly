import express from 'express'
import errorHandler from '../middlewares/error-handler'
import register from '../controllers/auth/register'

const router = express.Router()

router.post('/shorten', [], register, errorHandler)

export default router