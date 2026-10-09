
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Xml.Xsl;

namespace ReisZone.Pages;

public class IndexModel : PageModel
{
    public string TransformedXml { get; private set; } = "";

    private readonly IWebHostEnvironment _environment;

    public IndexModel(IWebHostEnvironment environment)
    {
        _environment = environment;
    }

    public void OnGet()
    {
        try
        {
            string xmlPath = Path.Combine(
                _environment.WebRootPath!,
                "XMLReis.xml"
            );

            string xsltPath = Path.Combine(
                _environment.WebRootPath!,
                "ReisParing.xslt"
            );

            if (!System.IO.File.Exists(xmlPath) ||
                !System.IO.File.Exists(xsltPath))
            {
                TransformedXml =
                    "<p>XML- või XSLT-faili ei leitud kaustast wwwroot.</p>";
                return;
            }

            var xslt = new XslCompiledTransform();
            xslt.Load(xsltPath);

            using var writer = new StringWriter();
            xslt.Transform(xmlPath, null, writer);

            TransformedXml = writer.ToString();
        }
        catch (Exception ex)
        {
            TransformedXml =
                $"<p>Viga XML-i kuvamisel: " +
                $"{System.Net.WebUtility.HtmlEncode(ex.Message)}</p>";
        }
    }
}