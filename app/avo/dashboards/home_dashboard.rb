class HomeDashboard < Avo::Dashboards::BaseDashboard
  self.id = "home_dashboard"
  self.name = "Home"
  self.grid_cols = 4

  card CurrentBalanceMetric
  card AccountBalanceMetric
  card TotalDonationsMetric
  card InternalDonationsMetric
  card TotalContributionsMetric
end
