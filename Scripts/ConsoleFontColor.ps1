Configuration ChangeConsoleFontColor
{
    Import-DscResource -ModuleName PSDesiredStateConfiguration
    
    Node $AllNodesNodeName
    {
        Registry Console
    }

}