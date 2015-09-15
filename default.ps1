properties {
    $databaseProjectName = "FluentMigratorDemo"
    $solutionFile = "FluentMigratorDemo.sln"
}

task Deploy -depends Compile {
    DeployDatabase
}

task Compile{
    msbuild $solutionFile /m /t:Rebuild /p:Configuration=Release /verbosity:quiet /p:RunOctoPack=true /p:VisualStudioVersion=12.0 

    if($lastexitcode -ne 0) {
        throw "Compile task failed!"
    }
}

function DeployDatabase()
{
    Set-Location ".\$databaseProjectName\bin\release"
    
    $OctopusEnvironmentName = "local"

    Invoke-Expression ".\deploy.ps1" 
}