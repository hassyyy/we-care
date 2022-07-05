class ContributionsMetric < Avo::Dashboards::MetricCard
  self.id = 'contributions_metric'
  self.label = 'Contributions'
  self.prefix = '₹'

  query do
    contributions = Contribution.sum(:value)

    result contributions
  end
end
