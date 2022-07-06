class BalanceMetric < Avo::Dashboards::MetricCard
  self.id = 'balance_metric'
  self.label = 'Balance'
  self.prefix = '₹'

  query do
    contributions = Contribution.sum(:value)
    donations = Donation.sum(:value)
    total = (contributions - donations)
    value = "#{total % 1000}"
    value.prepend("#{total / 1000},") if (total / 1000) > 0
    value.prepend("#{total / 100000}") if (total / 100000) > 0

    result value
  end
end
