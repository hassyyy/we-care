class CurrentBalanceMetric < Avo::Dashboards::MetricCard
  self.id = 'current_balance_metric'
  self.label = 'Current Balance'
  self.prefix = '₹'
  self.cols = 2

  query do
    contributions = Contribution.where(status: 'sent').sum(:value)
    resources = Resource.where(internal: false)
    donations = Donation.where(resource_id: resources.pluck(:id)).sum(:value)
    total = (contributions - donations)

    result number_to_currency(total, AppOptions::CURRENCY_FORMAT.merge(format: "%n"))
  end
end
