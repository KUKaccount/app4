class WelcomeController < ApplicationController
  def index
  end
  def profile
    @birthday = ""
    @hometown = ""
    @skills   = []
    @remarks  = ""
    @gender   = ""
  end
end
