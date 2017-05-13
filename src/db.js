import monk from 'monk'
import config from './config'

console.log('Connect DB to ', config.database.url);
export default monk(config.database.url)
