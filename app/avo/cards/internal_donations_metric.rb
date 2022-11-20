class InternalDonationsMetric < Avo::Dashboards::MetricCard
  self.id = 'Internal_donations_metric'
  self.label = 'Internal Donations'
  self.prefix = '₹'
  self.cols = 2

  query do
    resources = Resource.where(internal: true)
    donations = Donation.where(resource_id: resources.pluck(:id)).sum(:value)

    result number_to_currency(donations, AppOptions::CURRENCY_FORMAT.merge(format: "%n"))
  end
end
