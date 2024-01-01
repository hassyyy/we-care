class YearlyExpensesDashboard < Avo::Dashboards::BaseDashboard
    self.id = "yearly_expenses_dashboard"
    self.name = "Yearly Expenses"
  
    # cards go here
    card YearlyExpenses
  end
  