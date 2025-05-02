const ORIGIN = '*'
const PORT = process.env.PORT || 3333

const MONGO_URI = process.env.MONGO_URI
const MONGO_OPTIONS = {}

const JWT_SECRET = process.env.JWT_SECRET || 'unsafe_secret'

export { ORIGIN, PORT, JWT_SECRET }