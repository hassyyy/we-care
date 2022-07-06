class DonationsMetric < Avo::Dashboards::MetricCard
  self.id = 'donations_metric'
  self.label = 'Donations'
  self.prefix = '₹'

  query do
    donations = Donation.sum(:value)
    value = "#{donations % 1000}"
    value.prepend("#{donations / 1000},") if (donations / 1000) > 0
    value.prepend("#{donations / 100000}") if (donations / 100000) > 0

    result value
  end
end
