class ContributionsMetric < Avo::Dashboards::MetricCard
  self.id = 'contributions_metric'
  self.label = 'Contributions'
  self.prefix = '₹'

  query do
    contributions = Contribution.sum(:value)

    result number_to_currency(contributions, unit: "₹", delimiter: ",", precision: 0, format: "%n")
  end
end
