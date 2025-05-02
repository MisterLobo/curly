import express from 'express'
import errorHandler from '../middlewares/error-handler'
import login from '../controllers/auth/login'
import register from '../controllers/auth/register'
import checkBearerToken from '../middlewares/check-bearer-token'
import loginWithToken from '../controllers/auth/login-with-token'

const router = express.Router()

router.post('/register', [], register, errorHandler)

router.post('/login', [], login, errorHandler)

router.get('/login', [checkBearerToken], loginWithToken, errorHandler)

export default router