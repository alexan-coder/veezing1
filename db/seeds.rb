require "active_record" 
require "sinatra"
require "sinatra/activerecord"
require 'sinatra/simple-authentication'
require_relative "../config/environments"
require_relative "../models/user"
require_relative "../models/video"




Video.create([
  { :title => "Check out this dog's jam sesh", :desc => "This dog is so cool and he knows it!", :video_url => "//www.youtube.com/embed/2TN4NoA4brE" },
  { :title => "ABC's in 3D", :desc => "Incredibly creative typography pop-up book by Marion Bataille. Wow!", :video_url => "//www.youtube.com/embed/wnZr0wiG1Hg" },
  { :title => "A great excerpt from a 1980's talk show...", :desc => "He makes it look so easy!", :video_url => "//www.youtube.com/embed/IFt6MyiVx54" },
  { :title => "Building living bridges", :desc => "These natural bridges take generations to build. It's an amazing example of human connection with nature.", :video_url => "//www.youtube.com/embed/5jrmm7gjZGE" },
  { :title => "Circus takes over abandonned factory", :desc => "this video is pure talent everything form the filming, directing and ofcourse the performance! ", :video_url => "//www.youtube.com/embed/IP6W44RgmIg" },






])

