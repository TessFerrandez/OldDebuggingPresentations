using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Xml.Serialization;
using System.Text;

/// <summary>
/// Summary description for BusinessLayer
/// </summary>
public class BusinessLayer
{
    static object o = new object();

	public BusinessLayer()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    
    public void PerformSomeBusinessOperation(){
        lock (o)
        {
            System.Threading.Thread.Sleep(5000);
        }
    }

    public void SerializeStuff()
    {
        Address a = new Address("MyStreet", "MyCity");
        Person p = new Person("Tess", a);
        Type[] SerializationTypes = new Type[1];
        SerializationTypes[0] = a.GetType();

        XmlSerializer s = new XmlSerializer(p.GetType(), SerializationTypes);
    }

    public void ConcatenateBigString()
    {
        string s = "<dataset>";
        for (int i = 0; i < 8000; i++)
        {
            s+= "<ID>" + i.ToString() + "</ID><NAME>NameOfSomePerson</NAME>";
        }
        s += "</dataset>";
    }

    public void ConcatenateBigStringRev()
    {
        StringBuilder sb = new StringBuilder("<dataset>");
        for (int i = 0; i < 8000; i++)
        {
            sb.Append("<ID>" + i.ToString() + "</ID><NAME>NameOfSomePerson</NAME>");
        }
        sb.Append("</dataset>");
    }

    public void RandomExFunction()
    {
        Random r = new Random(System.DateTime.Now.Second);
        int random = r.Next();

        if (random % 4 == 0)
        {
            throw new System.Exception("A random exception");
        }
        else if (random % 5 == 0)
        {
            int i = 0;
            int j = 5;
            int k = j / i;
        }
        else if (random % 3 == 0)
        {
            object o = null;
            string s = o.ToString();
        }
        else
        {   
            File.Open("c:\\IDontExist.txt", FileMode.Open);
        }
    }
}

public class Person
{
    String m_name;
    Address m_address;

    public Person(String name, Address address)
    {
        m_name = name;
        m_address = address;
    }

    public Person()
    {
    }
}

public class Address
{
    String m_street;
    String m_city;

    public Address(string street, string city){
        m_street = street;
        m_city = city;
    }
    public Address()
    {
    }
}