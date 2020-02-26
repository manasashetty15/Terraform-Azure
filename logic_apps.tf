resource "azurerm_logic_app_workflow" "example" {
  name                = "workflow1"
  location            =  "eastus"
  resource_group_name =  "example_Group"
}

resource "azurerm_logic_app_action_custom" "example" {
  name         = "example-action"
  logic_app_id = "${azurerm_logic_app_workflow.example.id}"

  body = <<BODY
{
    "description": "A variable to configure the auto expiration age in days. Configured in negative number. Default is -30 (30 days old).",
    "inputs": {
        "variables": [
            {
                "name": "ExpirationAgeInDays",
                "type": "Integer",
                "value": -30
            }
        ]
    },
    "runAfter": {},
    "type": "InitializeVariable"
}
BODY
}