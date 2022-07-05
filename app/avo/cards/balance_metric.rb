class BalanceMetric < Avo::Dashboards::MetricCard
  self.id = 'balance_metric'
  self.label = 'Balance'
  self.prefix = '₹'

  query do
    contributions = Contribution.sum(:value)
    donations = Donation.sum(:value)

    result (contributions - donations)
  end
end
