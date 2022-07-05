class HomeDashboard < Avo::Dashboards::BaseDashboard
  self.id = "home_dashboard"
  self.name = "Home"

  card BalanceMetric
  card ContributionsMetric
  card DonationsMetric
end
