class Avo::BaseResourcesController < Avo::ResourcesController
  include SessionsHelper
  before_action :requires_login
end
