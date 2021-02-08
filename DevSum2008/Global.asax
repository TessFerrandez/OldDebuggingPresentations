<%@ Application Language="C#" %>
<%@ Import Namespace="System.Reflection" %>
<%@ Import Namespace="System.Diagnostics" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        HttpRuntime runtime = (HttpRuntime)typeof(System.Web.HttpRuntime).InvokeMember("_theRuntime",
                                                                                    BindingFlags.NonPublic
                                                                                    | BindingFlags.Static
                                                                                    | BindingFlags.GetField,
                                                                                    null,
                                                                                    null,
                                                                                    null);
        if (runtime == null)
            return;

        string shutDownMessage = (string)runtime.GetType().InvokeMember("_shutDownMessage",
                                                                     BindingFlags.NonPublic
                                                                     | BindingFlags.Instance
                                                                     | BindingFlags.GetField,
                                                                     null,
                                                                     runtime,
                                                                     null);

        string shutDownStack = (string)runtime.GetType().InvokeMember("_shutDownStack",
                                                                   BindingFlags.NonPublic
                                                                   | BindingFlags.Instance
                                                                   | BindingFlags.GetField,
                                                                   null,
                                                                   runtime,
                                                                   null);

        if (!EventLog.SourceExists(".NET Runtime"))
        {
            EventLog.CreateEventSource(".NET Runtime", "Application");
        }

        EventLog log = new EventLog();
        log.Source = ".NET Runtime";
        log.WriteEntry(String.Format("\r\n\r\n_shutDownMessage={0}\r\n\r\n_shutDownStack={1}",
                                 shutDownMessage,
                                 shutDownStack),
                                 EventLogEntryType.Error);

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
