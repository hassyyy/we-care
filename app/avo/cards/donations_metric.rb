class DonationsMetric < Avo::Dashboards::MetricCard
  self.id = 'donations_metric'
  self.label = 'Donations'
  self.prefix = '₹'

  query do
    donations = Donation.sum(:value)

    result donations
  end
end
