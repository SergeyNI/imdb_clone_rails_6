const { environment } = require('@rails/webpacker')
const jquery = require('./plugins/jquery')
const erb = require('./loaders/erb')

environment.loaders.prepend('erb', erb)
environment.plugins.prepend('jquery', jquery)
module.exports = environment
