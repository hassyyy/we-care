class TotalDonationsMetric < Avo::Dashboards::MetricCard
  self.id = 'total_donations_metric'
  self.label = 'Total Donations'
  self.prefix = '₹'
  self.cols = 2

  query do
    resources = Resource.where(internal: false)
    donations = Donation.where(resource_id: resources.pluck(:id)).sum(:value)

    result number_to_currency(donations, AppOptions::CURRENCY_FORMAT.merge(format: "%n"))
  end
end
