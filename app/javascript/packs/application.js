// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import * as bootstrap from "bootstrap"
// import '../stylesheets/application'
import jquery from 'jquery'
import './jquery.raty'
// import '../src/ratyrate.js.erb'
const importAll = (r) => r.keys().map(r)
importAll(require.context('../images', false, /\.(png|jpe?g|svg)$/));


// window.jQuery = jquery
// window.$ = jquery
require('./ratyrate.js.erb')
// require('./jquery.raty')



Rails.start()
Turbolinks.start()
ActiveStorage.start()
// $(document).on('turbolinks:load',function(){
//   $(".star").raty()
// })
$(document).on('turbolinks:load',$(".star").init)

// $(document).ready($.raty());
// $(document).on('page:change',$(".star").raty());