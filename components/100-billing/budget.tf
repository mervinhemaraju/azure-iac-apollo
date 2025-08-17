resource "azurerm_consumption_budget_subscription" "strict" {
  name            = "strict-budget"
  subscription_id = data.azurerm_subscription.current.id

  amount     = 2
  time_grain = "Monthly"

  time_period {
    start_date = "2025-08-01T00:00:00Z"
    end_date   = "2090-01-01T00:00:00Z"
  }

  # Add Actual and forecasted notifications
  notification {
    enabled   = true
    threshold = 80.0
    operator  = "EqualTo"

    contact_emails = [
      local.constants.owner_email
    ]
  }

  notification {
    enabled        = true
    threshold      = 100.0
    operator       = "GreaterThan"
    threshold_type = "Forecasted"

    contact_emails = [
      local.constants.owner_email
    ]
  }
}
