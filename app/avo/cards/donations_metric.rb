class DonationsMetric < Avo::Dashboards::MetricCard
  self.id = 'donations_metric'
  self.label = 'Donations'
  self.prefix = '₹'

  query do
    donations = Donation.sum(:value)

    result number_to_currency(donations, unit: "₹", delimiter: ",", precision: 0, format: "%n")
  end
end
