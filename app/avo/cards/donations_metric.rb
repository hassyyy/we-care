class DonationsMetric < Avo::Dashboards::MetricCard
  self.id = 'donations_metric'
  self.label = 'Donations'
  self.prefix = '₹'

  query do
    donations = Donation.sum(:value)

    result number_to_currency(donations, AppOptions::CURRENCY_FORMAT.merge(format: "%n"))
  end
end
