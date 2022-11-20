class AccountBalanceMetric < Avo::Dashboards::MetricCard
  self.id = 'account_balance_metric'
  self.label = 'Account Balance'
  self.prefix = '₹'
  self.cols = 2


  query do
    contributions = Contribution.where(status: 'sent').sum(:value)
    donations = Donation.sum(:value)
    total = (contributions - donations)

    result number_to_currency(total, AppOptions::CURRENCY_FORMAT.merge(format: "%n"))
  end
end
