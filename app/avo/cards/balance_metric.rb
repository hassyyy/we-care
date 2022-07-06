class BalanceMetric < Avo::Dashboards::MetricCard
  self.id = 'balance_metric'
  self.label = 'Balance'
  self.prefix = '₹'

  query do
    contributions = Contribution.sum(:value)
    donations = Donation.sum(:value)
    total = (contributions - donations)

    result number_to_currency(total, unit: "₹", delimiter: ",", precision: 0, format: "%n")
  end
end
