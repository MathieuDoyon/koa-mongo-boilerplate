import Koa from 'koa'
import Router from 'koa-router'
import bodyParser from 'koa-bodyparser'
import logger from 'koa-pino-logger'
import index from 'routes/index'
import config from './config'

const app: Koa = new Koa()
const router: Router = new Router()

app.use(logger({
  name: config.app.id,
  level: config.logger.level,
  enabled: config.logger.enabled
}))
app.use(bodyParser())

app.use(router.routes())
app.use(router.allowedMethods({
  throw: true
}))

// routes
app.use(index.routes(), index.allowedMethods())

export default app
