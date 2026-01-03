import xml.etree.ElementTree as ET

path = "/app/share/metainfo/releases/net.odamex.Odamex.releases.xml"

tree = ET.parse(path)
root = tree.getroot()

releases = root.find("releases")
if releases is not None:
    root.remove(releases)

external = ET.Element("releases")
external.set("type", "external")
root.append(external)

ET.indent(tree)

tree.write(path, encoding="utf-8", xml_declaration=True)