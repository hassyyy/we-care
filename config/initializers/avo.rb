# For more information regaring these settings check out our docs https://docs.avohq.io
Avo.configure do |config|
  ## == Routing ==
  config.root_path = '/avo'

  ## == Licensing ==
  config.license = 'community' # change this to 'pro' when you add the license key
  # config.license_key = ENV['AVO_LICENSE_KEY']

  ## == Set the context ==
  config.set_context do
    {
      user: current_user
    }
    # Return a context object that gets evaluated in Avo::ApplicationController
  end


  ## == Authentication ==
  config.current_user_method do
    current_user
  end
  config.current_user_resource_name = :user
  config.profile_menu = -> {
    link "Profile", path: "/avo/resources/users/#{current_user&.id}", icon: "user-circle"
  }

  ## == Authorization ==
  config.authorization_methods = {
    index: 'index?',
    show: 'show?',
    edit: 'edit?',
    new: 'new?',
    update: 'update?',
    create: 'create?',
    destroy: 'destroy?',
  }

  ## == Localization ==
  # config.locale = 'en-US'

  ## == Customization ==
  config.app_name = 'We Care'
  config.timezone = 'IST'
  # config.currency = 'USD'
  config.per_page = 30
  config.disabled_features = [:global_search]
  # config.per_page_steps = [12, 24, 48, 72]
  # config.via_per_page = 8
  # config.default_view_type = :table
  # config.id_links_to_resource = false
  # config.full_width_container = false
  # config.full_width_index_view = false
  config.cache_resources_on_index_view = false
  # config.search_debounce = 300
  # config.view_component_path = "app/components"
  # config.display_license_request_timeout_error = true
  config.buttons_on_form_footers = true

  config.main_menu = -> {
    dashboard :home_dashboard
    dashboard :yearly_expenses_dashboard
    section "Transactions", icon: "heroicons/solid/currency-rupee" do
      resource :contribution
      resource :donation
    end
    section "Resources", icon: "heroicons/solid/users" do
      resource :recipient
      resource :user
    end
  }

  # Where should the user be redirected when he hits the `/avo` url
  config.home_path = '/avo/dashboards/home_dashboard'

  # https://tailwindcss.com/docs/customizing-colors - Green
  config.branding = {
    colors: {
      background: "240 253 244",
      100 => "#dcfce7",
      400 => "#4ade80",
      500 => "#22c55e",
      600 => "#16a34a",
    },
    logo: "/assets/we-care.png",
    logomark: "/assets/we-care.png",
    favicon: "/assets/we-care.ico"
  }

  ## == Breadcrumbs ==
  # config.display_breadcrumbs = true
  # config.set_initial_breadcrumbs do
  #   add_breadcrumb "Home", '/avo'
  # end
end
