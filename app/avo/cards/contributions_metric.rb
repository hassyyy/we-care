class ContributionsMetric < Avo::Dashboards::MetricCard
  self.id = 'contributions_metric'
  self.label = 'Contributions'
  self.prefix = '₹'

  query do
    contributions = Contribution.sum(:value)
    value = "#{contributions % 1000}"
    value.prepend("#{contributions / 1000},") if (contributions / 1000) > 0
    value.prepend("#{contributions / 100000}") if (contributions / 100000) > 0

    result value
  end
end
