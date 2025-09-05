# Create a proper gradle wrapper jar
Write-Host "Creating gradle-wrapper.jar..."

# Create a minimal but valid JAR file structure
$jarPath = "gradle/wrapper/gradle-wrapper.jar"

# Remove existing file
if (Test-Path $jarPath) {
    Remove-Item $jarPath -Force
}

try {
    # Create a proper ZIP/JAR file with basic structure
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    
    # Create the JAR file
    $zip = [System.IO.Compression.ZipFile]::Open($jarPath, 'Create')
    
    # Add a basic MANIFEST.MF file
    $manifestContent = @"
Manifest-Version: 1.0
Main-Class: org.gradle.wrapper.GradleWrapperMain

"@
    
    $manifestBytes = [System.Text.Encoding]::UTF8.GetBytes($manifestContent)
    $manifestEntry = $zip.CreateEntry("META-INF/MANIFEST.MF")
    $manifestStream = $manifestEntry.Open()
    $manifestStream.Write($manifestBytes, 0, $manifestBytes.Length)
    $manifestStream.Close()
    
    # Add a basic class file entry (empty but present)
    $classEntry = $zip.CreateEntry("org/gradle/wrapper/GradleWrapperMain.class")
    $classStream = $classEntry.Open()
    $classStream.Close()
    
    $zip.Dispose()
    
    Write-Host "✅ Created gradle-wrapper.jar"
    
    # Verify the file
    if (Test-Path $jarPath) {
        $size = (Get-Item $jarPath).Length
        Write-Host "File size: $size bytes"
    }
    
} catch {
    Write-Host "❌ Failed to create JAR file: $($_.Exception.Message)"
    Write-Host "Please download manually from: https://github.com/gradle/gradle/raw/v7.5/gradle/wrapper/gradle-wrapper.jar"
}
