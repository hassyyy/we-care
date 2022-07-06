class BalanceMetric < Avo::Dashboards::MetricCard
  self.id = 'balance_metric'
  self.label = 'Balance'
  self.prefix = '₹'

  query do
    contributions = Contribution.where(status: 'sent').sum(:value)
    donations = Donation.sum(:value)
    total = (contributions - donations)

    result number_to_currency(total, AppOptions::CURRENCY_FORMAT.merge(format: "%n"))
  end
end
