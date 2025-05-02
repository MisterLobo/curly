import jsonwebtoken from 'jsonwebtoken'
import { JWT_SECRET } from '../constants/index'

class JWT {
  instance: typeof jsonwebtoken = jsonwebtoken
  secret: string

  constructor() {
    this.secret = JWT_SECRET
  }

  signToken(payload: Record<string, any>, expiresIn: jsonwebtoken.SignOptions['expiresIn'] = '12h') {
    return this.instance.sign(payload, JWT_SECRET, { expiresIn })
  }

  verifyToken(token: string) {
    return this.instance.verify(token, JWT_SECRET)
  }
}

export default new JWT()