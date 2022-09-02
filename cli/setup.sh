
# rc install - uncomment and adjust below to run all tests on a CLI release candidate
# az extension remove -n ml

# Use a daily build
# az extension add --source https://azuremlsdktestpypi.blob.core.windows.net/wheels/sdk-cli-v2-public/ml-2.6.0-py3-none-any.whl --yes
 
# <set_variables>
GROUP="azureml-examples"
LOCATION="eastus"
WORKSPACE="main"
# </set_variables>

if [[ $(az group exists --name $GROUP -o tsv) = true ]]
then
    # Installing extension temporarily assuming the run is on old subscription
    # without bootstrap script.

    # <az_ml_install>
    az extension add -n ml -y
    # </az_ml_install>

    # <az_configure_defaults>
    az configure --defaults group=$GROUP workspace=$WORKSPACE location=$LOCATION
    # </az_configure_defaults>
    echo "Default resource group set to $GROUP"
else
    echo "Specified resource group doesn't exist in the current subscription"
fi