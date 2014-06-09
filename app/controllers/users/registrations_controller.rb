# encoding: utf-8
class Users::RegistrationsController < Devise::RegistrationsController
  def edit
    super
    render :layout => "my"
  end
end
