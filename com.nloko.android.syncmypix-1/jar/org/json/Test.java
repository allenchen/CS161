// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   Test.java

package org.json;

import java.io.PrintStream;
import java.io.StringWriter;
import java.util.Iterator;

// Referenced classes of package org.json:
//            XML, JSONObject, JSONML, JSONArray, 
//            JSONStringer, JSONWriter, HTTP, CookieList, 
//            Cookie, JSONTokener, CDL

public class Test
{

    public Test()
    {
    }

    public static void main(String args[])
    {
        JSONStringer jsonstringer;
        _cls1Obj _lcls1obj = new _cls1Obj("A beany object", 42D, true);
        try
        {
            JSONObject jsonobject = XML.toJSONObject("<![CDATA[This is a collection of test patterns and examples for org.json.]]>  Ignore the stuff past the end.  ");
            PrintStream printstream = System.out;
            String s = jsonobject.toString();
            printstream.println(s);
            JSONObject jsonobject1 = new JSONObject("{     \"list of lists\" : [         [1, 2, 3],         [4, 5, 6],     ] }");
            PrintStream printstream1 = System.out;
            String s1 = jsonobject1.toString(4);
            printstream1.println(s1);
            PrintStream printstream2 = System.out;
            String s2 = XML.toString(jsonobject1);
            printstream2.println(s2);
            JSONObject jsonobject2 = XML.toJSONObject("<recipe name=\"bread\" prep_time=\"5 mins\" cook_time=\"3 hours\"> <title>Basic bread</title> <ingredient amount=\"8\" unit=\"dL\">Flour</ingredient> <ingredient amount=\"10\" unit=\"grams\">Yeast</ingredient> <ingredient amount=\"4\" unit=\"dL\" state=\"warm\">Water</ingredient> <ingredient amount=\"1\" unit=\"teaspoon\">Salt</ingredient> <instructions> <step>Mix all ingredients together.</step> <step>Knead thoroughly.</step> <step>Cover with a cloth, and leave for one hour in warm room.</step> <step>Knead again.</step> <step>Place in a bread baking tin.</step> <step>Cover with a cloth, and leave for one hour in warm room.</step> <step>Bake in the oven at 180(degrees)C for 30 minutes.</step> </instructions> </recipe> ");
            PrintStream printstream3 = System.out;
            String s3 = jsonobject2.toString(4);
            printstream3.println(s3);
            System.out.println();
            JSONObject jsonobject3 = JSONML.toJSONObject("<recipe name=\"bread\" prep_time=\"5 mins\" cook_time=\"3 hours\"> <title>Basic bread</title> <ingredient amount=\"8\" unit=\"dL\">Flour</ingredient> <ingredient amount=\"10\" unit=\"grams\">Yeast</ingredient> <ingredient amount=\"4\" unit=\"dL\" state=\"warm\">Water</ingredient> <ingredient amount=\"1\" unit=\"teaspoon\">Salt</ingredient> <instructions> <step>Mix all ingredients together.</step> <step>Knead thoroughly.</step> <step>Cover with a cloth, and leave for one hour in warm room.</step> <step>Knead again.</step> <step>Place in a bread baking tin.</step> <step>Cover with a cloth, and leave for one hour in warm room.</step> <step>Bake in the oven at 180(degrees)C for 30 minutes.</step> </instructions> </recipe> ");
            PrintStream printstream4 = System.out;
            String s4 = jsonobject3.toString();
            printstream4.println(s4);
            PrintStream printstream5 = System.out;
            String s5 = JSONML.toString(jsonobject3);
            printstream5.println(s5);
            System.out.println();
            JSONArray jsonarray = JSONML.toJSONArray("<recipe name=\"bread\" prep_time=\"5 mins\" cook_time=\"3 hours\"> <title>Basic bread</title> <ingredient amount=\"8\" unit=\"dL\">Flour</ingredient> <ingredient amount=\"10\" unit=\"grams\">Yeast</ingredient> <ingredient amount=\"4\" unit=\"dL\" state=\"warm\">Water</ingredient> <ingredient amount=\"1\" unit=\"teaspoon\">Salt</ingredient> <instructions> <step>Mix all ingredients together.</step> <step>Knead thoroughly.</step> <step>Cover with a cloth, and leave for one hour in warm room.</step> <step>Knead again.</step> <step>Place in a bread baking tin.</step> <step>Cover with a cloth, and leave for one hour in warm room.</step> <step>Bake in the oven at 180(degrees)C for 30 minutes.</step> </instructions> </recipe> ");
            PrintStream printstream6 = System.out;
            String s6 = jsonarray.toString(4);
            printstream6.println(s6);
            PrintStream printstream7 = System.out;
            String s7 = JSONML.toString(jsonarray);
            printstream7.println(s7);
            System.out.println();
            JSONObject jsonobject4 = JSONML.toJSONObject("<div id=\"demo\" class=\"JSONML\"><p>JSONML is a transformation between <b>JSON</b> and <b>XML</b> that preserves ordering of document features.</p><p>JSONML can work with JSON arrays or JSON objects.</p><p>Three<br/>little<br/>words</p></div>");
            PrintStream printstream8 = System.out;
            String s8 = jsonobject4.toString(4);
            printstream8.println(s8);
            PrintStream printstream9 = System.out;
            String s9 = JSONML.toString(jsonobject4);
            printstream9.println(s9);
            System.out.println();
            JSONArray jsonarray1 = JSONML.toJSONArray("<div id=\"demo\" class=\"JSONML\"><p>JSONML is a transformation between <b>JSON</b> and <b>XML</b> that preserves ordering of document features.</p><p>JSONML can work with JSON arrays or JSON objects.</p><p>Three<br/>little<br/>words</p></div>");
            PrintStream printstream10 = System.out;
            String s10 = jsonarray1.toString(4);
            printstream10.println(s10);
            PrintStream printstream11 = System.out;
            String s11 = JSONML.toString(jsonarray1);
            printstream11.println(s11);
            System.out.println();
            JSONObject jsonobject5 = XML.toJSONObject("<person created=\"2006-11-11T19:23\" modified=\"2006-12-31T23:59\">\n <firstName>Robert</firstName>\n <lastName>Smith</lastName>\n <address type=\"home\">\n <street>12345 Sixth Ave</street>\n <city>Anytown</city>\n <state>CA</state>\n <postalCode>98765-4321</postalCode>\n </address>\n </person>");
            PrintStream printstream12 = System.out;
            String s12 = jsonobject5.toString(4);
            printstream12.println(s12);
            JSONObject jsonobject6 = new JSONObject(_lcls1obj);
            PrintStream printstream13 = System.out;
            String s13 = jsonobject6.toString();
            printstream13.println(s13);
            JSONObject jsonobject7 = new JSONObject("{ \"entity\": { \"imageURL\": \"\", \"name\": \"IXXXXXXXXXXXXX\", \"id\": 12336, \"ratingCount\": null, \"averageRating\": null } }");
            PrintStream printstream14 = System.out;
            String s14 = jsonobject7.toString(2);
            printstream14.println(s14);
            JSONWriter jsonwriter = (new JSONStringer()).object().key("single").value("MARIE HAA'S").key("Johnny").value("MARIE HAA\\'S").key("foo").value("bar").key("baz").array().object().key("quux").value("Thanks, Josh!").endObject().endArray().key("obj keys");
            String args1[] = JSONObject.getNames(_lcls1obj);
            String s15 = jsonwriter.value(args1).endObject().toString();
            System.out.println(s15);
            PrintStream printstream15 = System.out;
            String s16 = (new JSONStringer()).object().key("a").array().array().array().value("b").endArray().endArray().endArray().endObject().toString();
            printstream15.println(s16);
            jsonstringer = new JSONStringer();
            JSONWriter jsonwriter1 = jsonstringer.array();
            JSONWriter jsonwriter2 = jsonstringer.value(1L);
            JSONWriter jsonwriter3 = jsonstringer.array();
            JSONWriter jsonwriter4 = jsonstringer.value(null);
            JSONWriter jsonwriter5 = jsonstringer.array();
            JSONWriter jsonwriter6 = jsonstringer.object();
            JSONWriter jsonwriter7 = jsonstringer.key("empty-array").array().endArray();
            JSONWriter jsonwriter8 = jsonstringer.key("answer").value(42L);
            JSONWriter jsonwriter9 = jsonstringer.key("null").value(null);
            JSONWriter jsonwriter10 = jsonstringer.key("false").value(false);
            JSONWriter jsonwriter11 = jsonstringer.key("true").value(true);
            JSONWriter jsonwriter12 = jsonstringer.key("big").value(1.2345678900000001E+96D);
            JSONWriter jsonwriter13 = jsonstringer.key("small").value(1.2345678899999999E-80D);
            JSONWriter jsonwriter14 = jsonstringer.key("empty-object").object().endObject();
            JSONWriter jsonwriter15 = jsonstringer.key("long");
            JSONWriter jsonwriter16 = jsonstringer.value(0x7fffffffffffffffL);
            JSONWriter jsonwriter17 = jsonstringer.endObject();
            JSONWriter jsonwriter18 = jsonstringer.value("two");
            JSONWriter jsonwriter19 = jsonstringer.endArray();
            JSONWriter jsonwriter20 = jsonstringer.value(true);
            JSONWriter jsonwriter21 = jsonstringer.endArray();
            JSONWriter jsonwriter22 = jsonstringer.value(98.599999999999994D);
            JSONWriter jsonwriter23 = jsonstringer.value(-100D);
            JSONWriter jsonwriter24 = jsonstringer.object();
            JSONWriter jsonwriter25 = jsonstringer.endObject();
            JSONWriter jsonwriter26 = jsonstringer.object();
            JSONWriter jsonwriter27 = jsonstringer.key("one");
            JSONWriter jsonwriter28 = jsonstringer.value(1D);
            JSONWriter jsonwriter29 = jsonstringer.endObject();
            JSONWriter jsonwriter30 = jsonstringer.value(_lcls1obj);
            JSONWriter jsonwriter31 = jsonstringer.endArray();
            PrintStream printstream16 = System.out;
            String s17 = jsonstringer.toString();
            printstream16.println(s17);
            PrintStream printstream17 = System.out;
            String s18 = jsonstringer.toString();
            String s19 = (new JSONArray(s18)).toString(4);
            printstream17.println(s19);
            int ai[] = {
                1, 2, 3
            };
            JSONArray jsonarray2 = new JSONArray(ai);
            PrintStream printstream18 = System.out;
            String s20 = jsonarray2.toString();
            printstream18.println(s20);
            String args2[] = new String[3];
            args2[0] = "aString";
            args2[1] = "aNumber";
            args2[2] = "aBoolean";
            JSONObject jsonobject8 = new JSONObject(_lcls1obj, args2);
            JSONObject jsonobject9 = jsonobject8.put("Testing JSONString interface", _lcls1obj);
            PrintStream printstream19 = System.out;
            String s21 = jsonobject8.toString(4);
            printstream19.println(s21);
            JSONObject jsonobject10 = new JSONObject("{slashes: '///', closetag: '</script>', backslash:'\\\\', ei: {quotes: '\"\\''},eo: {a: '\"quoted\"', b:\"don't\"}, quotes: [\"'\", '\"']}");
            PrintStream printstream20 = System.out;
            String s22 = jsonobject10.toString(2);
            printstream20.println(s22);
            PrintStream printstream21 = System.out;
            String s23 = XML.toString(jsonobject10);
            printstream21.println(s23);
            System.out.println("");
            JSONObject jsonobject11 = new JSONObject("{foo: [true, false,9876543210,    0.0, 1.00000001,  1.000000000001, 1.00000000000000001, .00000000000000001, 2.00, 0.1, 2e100, -32,[],{}, \"string\"],   to   : null, op : 'Good',ten:10} postfix comment");
            JSONObject jsonobject12 = jsonobject11.put("String", "98.6");
            JSONObject jsonobject13 = new JSONObject();
            JSONObject jsonobject14 = jsonobject11.put("JSONObject", jsonobject13);
            JSONArray jsonarray3 = new JSONArray();
            JSONObject jsonobject15 = jsonobject11.put("JSONArray", jsonarray3);
            JSONObject jsonobject16 = jsonobject11.put("int", 57);
            JSONObject jsonobject17 = jsonobject11.put("double", 1.2345678901234568E+29D);
            JSONObject jsonobject18 = jsonobject11.put("true", true);
            JSONObject jsonobject19 = jsonobject11.put("false", false);
            Object obj1 = JSONObject.NULL;
            JSONObject jsonobject20 = jsonobject11.put("null", obj1);
            JSONObject jsonobject21 = jsonobject11.put("bool", "true");
            JSONObject jsonobject22 = jsonobject11.put("zero", -0D);
            JSONObject jsonobject23 = jsonobject11.put("\\u2028", "\u2028");
            JSONObject jsonobject24 = jsonobject11.put("\\u2029", "\u2029");
            JSONArray jsonarray4 = jsonobject11.getJSONArray("foo");
            JSONArray jsonarray5 = jsonarray4.put(666);
            JSONArray jsonarray6 = jsonarray4.put(2001.99D);
            JSONArray jsonarray7 = jsonarray4.put("so \"fine\".");
            JSONArray jsonarray8 = jsonarray4.put("so <fine>.");
            JSONArray jsonarray9 = jsonarray4.put(true);
            JSONArray jsonarray10 = jsonarray4.put(false);
            JSONArray jsonarray11 = new JSONArray();
            JSONArray jsonarray12 = jsonarray4.put(jsonarray11);
            JSONObject jsonobject25 = new JSONObject();
            JSONArray jsonarray13 = jsonarray4.put(jsonobject25);
            String args3[] = JSONObject.getNames(jsonobject11);
            JSONObject jsonobject26 = jsonobject11.put("keys", args3);
            PrintStream printstream22 = System.out;
            String s24 = jsonobject11.toString(4);
            printstream22.println(s24);
            PrintStream printstream23 = System.out;
            String s25 = XML.toString(jsonobject11);
            printstream23.println(s25);
            PrintStream printstream24 = System.out;
            StringBuilder stringbuilder = (new StringBuilder()).append("String: ");
            double d = jsonobject11.getDouble("String");
            String s26 = stringbuilder.append(d).toString();
            printstream24.println(s26);
            PrintStream printstream25 = System.out;
            StringBuilder stringbuilder1 = (new StringBuilder()).append("  bool: ");
            boolean flag = jsonobject11.getBoolean("bool");
            String s27 = stringbuilder1.append(flag).toString();
            printstream25.println(s27);
            PrintStream printstream26 = System.out;
            StringBuilder stringbuilder2 = (new StringBuilder()).append("    to: ");
            String s28 = jsonobject11.getString("to");
            String s29 = stringbuilder2.append(s28).toString();
            printstream26.println(s29);
            PrintStream printstream27 = System.out;
            StringBuilder stringbuilder3 = (new StringBuilder()).append("  true: ");
            String s30 = jsonobject11.getString("true");
            String s31 = stringbuilder3.append(s30).toString();
            printstream27.println(s31);
            PrintStream printstream28 = System.out;
            StringBuilder stringbuilder4 = (new StringBuilder()).append("   foo: ");
            JSONArray jsonarray14 = jsonobject11.getJSONArray("foo");
            String s32 = stringbuilder4.append(jsonarray14).toString();
            printstream28.println(s32);
            PrintStream printstream29 = System.out;
            StringBuilder stringbuilder5 = (new StringBuilder()).append("    op: ");
            String s33 = jsonobject11.getString("op");
            String s34 = stringbuilder5.append(s33).toString();
            printstream29.println(s34);
            PrintStream printstream30 = System.out;
            StringBuilder stringbuilder6 = (new StringBuilder()).append("   ten: ");
            int i = jsonobject11.getInt("ten");
            String s35 = stringbuilder6.append(i).toString();
            printstream30.println(s35);
            PrintStream printstream31 = System.out;
            StringBuilder stringbuilder7 = (new StringBuilder()).append("  oops: ");
            boolean flag1 = jsonobject11.optBoolean("oops");
            String s36 = stringbuilder7.append(flag1).toString();
            printstream31.println(s36);
            JSONObject jsonobject27 = XML.toJSONObject("<xml one = 1 two=' \"2\" '><five></five>First \t&lt;content&gt;<five></five> This is \"content\". <three>  3  </three>JSON does not preserve the sequencing of elements and contents.<three>  III  </three>  <three>  T H R E E</three><four/>Content text is an implied structure in XML. <six content=\"6\"/>JSON does not have implied structure:<seven>7</seven>everything is explicit.<![CDATA[CDATA blocks<are><supported>!]]></xml>");
            PrintStream printstream32 = System.out;
            String s37 = jsonobject27.toString(2);
            printstream32.println(s37);
            PrintStream printstream33 = System.out;
            String s38 = XML.toString(jsonobject27);
            printstream33.println(s38);
            System.out.println("");
            JSONArray jsonarray15 = JSONML.toJSONArray("<xml one = 1 two=' \"2\" '><five></five>First \t&lt;content&gt;<five></five> This is \"content\". <three>  3  </three>JSON does not preserve the sequencing of elements and contents.<three>  III  </three>  <three>  T H R E E</three><four/>Content text is an implied structure in XML. <six content=\"6\"/>JSON does not have implied structure:<seven>7</seven>everything is explicit.<![CDATA[CDATA blocks<are><supported>!]]></xml>");
            PrintStream printstream34 = System.out;
            String s39 = jsonarray15.toString(4);
            printstream34.println(s39);
            PrintStream printstream35 = System.out;
            String s40 = JSONML.toString(jsonarray15);
            printstream35.println(s40);
            System.out.println("");
            JSONArray jsonarray16 = JSONML.toJSONArray("<xml do='0'>uno<a re='1' mi='2'>dos<b fa='3'/>tres<c>true</c>quatro</a>cinqo<d>seis<e/></d></xml>");
            PrintStream printstream36 = System.out;
            String s41 = jsonarray16.toString(4);
            printstream36.println(s41);
            PrintStream printstream37 = System.out;
            String s42 = JSONML.toString(jsonarray16);
            printstream37.println(s42);
            System.out.println("");
            JSONObject jsonobject28 = XML.toJSONObject("<mapping><empty/>   <class name = \"Customer\">      <field name = \"ID\" type = \"string\">         <bind-xml name=\"ID\" node=\"attribute\"/>      </field>      <field name = \"FirstName\" type = \"FirstName\"/>      <field name = \"MI\" type = \"MI\"/>      <field name = \"LastName\" type = \"LastName\"/>   </class>   <class name = \"FirstName\">      <field name = \"text\">         <bind-xml name = \"text\" node = \"text\"/>      </field>   </class>   <class name = \"MI\">      <field name = \"text\">         <bind-xml name = \"text\" node = \"text\"/>      </field>   </class>   <class name = \"LastName\">      <field name = \"text\">         <bind-xml name = \"text\" node = \"text\"/>      </field>   </class></mapping>");
            PrintStream printstream38 = System.out;
            String s43 = jsonobject28.toString(2);
            printstream38.println(s43);
            PrintStream printstream39 = System.out;
            String s44 = XML.toString(jsonobject28);
            printstream39.println(s44);
            System.out.println("");
            JSONArray jsonarray17 = JSONML.toJSONArray("<mapping><empty/>   <class name = \"Customer\">      <field name = \"ID\" type = \"string\">         <bind-xml name=\"ID\" node=\"attribute\"/>      </field>      <field name = \"FirstName\" type = \"FirstName\"/>      <field name = \"MI\" type = \"MI\"/>      <field name = \"LastName\" type = \"LastName\"/>   </class>   <class name = \"FirstName\">      <field name = \"text\">         <bind-xml name = \"text\" node = \"text\"/>      </field>   </class>   <class name = \"MI\">      <field name = \"text\">         <bind-xml name = \"text\" node = \"text\"/>      </field>   </class>   <class name = \"LastName\">      <field name = \"text\">         <bind-xml name = \"text\" node = \"text\"/>      </field>   </class></mapping>");
            PrintStream printstream40 = System.out;
            String s45 = jsonarray17.toString(4);
            printstream40.println(s45);
            PrintStream printstream41 = System.out;
            String s46 = JSONML.toString(jsonarray17);
            printstream41.println(s46);
            System.out.println("");
            JSONObject jsonobject29 = XML.toJSONObject("<?xml version=\"1.0\" ?><Book Author=\"Anonymous\"><Title>Sample Book</Title><Chapter id=\"1\">This is chapter 1. It is not very long or interesting.</Chapter><Chapter id=\"2\">This is chapter 2. Although it is longer than chapter 1, it is not any more interesting.</Chapter></Book>");
            PrintStream printstream42 = System.out;
            String s47 = jsonobject29.toString(2);
            printstream42.println(s47);
            PrintStream printstream43 = System.out;
            String s48 = XML.toString(jsonobject29);
            printstream43.println(s48);
            System.out.println("");
            JSONObject jsonobject30 = XML.toJSONObject("<!DOCTYPE bCard 'http://www.cs.caltech.edu/~adam/schemas/bCard'><bCard><?xml default bCard        firstname = ''        lastname  = '' company   = '' email = '' homepage  = ''?><bCard        firstname = 'Rohit'        lastname  = 'Khare'        company   = 'MCI'        email     = 'khare@mci.net'        homepage  = 'http://pest.w3.org/'/><bCard        firstname = 'Adam'        lastname  = 'Rifkin'        company   = 'Caltech Infospheres Project'        email     = 'adam@cs.caltech.edu'        homepage  = 'http://www.cs.caltech.edu/~adam/'/></bCard>");
            PrintStream printstream44 = System.out;
            String s49 = jsonobject30.toString(2);
            printstream44.println(s49);
            PrintStream printstream45 = System.out;
            String s50 = XML.toString(jsonobject30);
            printstream45.println(s50);
            System.out.println("");
            JSONObject jsonobject31 = XML.toJSONObject("<?xml version=\"1.0\"?><customer>    <firstName>        <text>Fred</text>    </firstName>    <ID>fbs0001</ID>    <lastName> <text>Scerbo</text>    </lastName>    <MI>        <text>B</text>    </MI></customer>");
            PrintStream printstream46 = System.out;
            String s51 = jsonobject31.toString(2);
            printstream46.println(s51);
            PrintStream printstream47 = System.out;
            String s52 = XML.toString(jsonobject31);
            printstream47.println(s52);
            System.out.println("");
            JSONObject jsonobject32 = XML.toJSONObject("<!ENTITY tp-address PUBLIC '-//ABC University::Special Collections Library//TEXT (titlepage: name and address)//EN' 'tpspcoll.sgm'><list type='simple'><head>Repository Address </head><item>Special Collections Library</item><item>ABC University</item><item>Main Library, 40 Circle Drive</item><item>Ourtown, Pennsylvania</item><item>17654 USA</item></list>");
            PrintStream printstream48 = System.out;
            String s53 = jsonobject32.toString();
            printstream48.println(s53);
            PrintStream printstream49 = System.out;
            String s54 = XML.toString(jsonobject32);
            printstream49.println(s54);
            System.out.println("");
            JSONObject jsonobject33 = XML.toJSONObject("<test intertag status=ok><empty/>deluxe<blip sweet=true>&amp;&quot;toot&quot;&toot;&#x41;</blip><x>eks</x><w>bonus</w><w>bonus2</w></test>");
            PrintStream printstream50 = System.out;
            String s55 = jsonobject33.toString(2);
            printstream50.println(s55);
            PrintStream printstream51 = System.out;
            String s56 = XML.toString(jsonobject33);
            printstream51.println(s56);
            System.out.println("");
            JSONObject jsonobject34 = HTTP.toJSONObject("GET / HTTP/1.0\nAccept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, application/vnd.ms-powerpoint, application/vnd.ms-excel, application/msword, */*\nAccept-Language: en-us\nUser-Agent: Mozilla/4.0 (compatible; MSIE 5.5; Windows 98; Win 9x 4.90; T312461; Q312461)\nHost: www.nokko.com\nConnection: keep-alive\nAccept-encoding: gzip, deflate\n");
            PrintStream printstream52 = System.out;
            String s57 = jsonobject34.toString(2);
            printstream52.println(s57);
            PrintStream printstream53 = System.out;
            String s58 = HTTP.toString(jsonobject34);
            printstream53.println(s58);
            System.out.println("");
            JSONObject jsonobject35 = HTTP.toJSONObject("HTTP/1.1 200 Oki Doki\nDate: Sun, 26 May 2002 17:38:52 GMT\nServer: Apache/1.3.23 (Unix) mod_perl/1.26\nKeep-Alive: timeout=15, max=100\nConnection: Keep-Alive\nTransfer-Encoding: chunked\nContent-Type: text/html\n");
            PrintStream printstream54 = System.out;
            String s59 = jsonobject35.toString(2);
            printstream54.println(s59);
            PrintStream printstream55 = System.out;
            String s60 = HTTP.toString(jsonobject35);
            printstream55.println(s60);
            System.out.println("");
            JSONObject jsonobject36 = new JSONObject("{nix: null, nux: false, null: 'null', 'Request-URI': '/', Method: 'GET', 'HTTP-Version': 'HTTP/1.0'}");
            PrintStream printstream56 = System.out;
            String s61 = jsonobject36.toString(2);
            printstream56.println(s61);
            PrintStream printstream57 = System.out;
            StringBuilder stringbuilder8 = (new StringBuilder()).append("isNull: ");
            boolean flag2 = jsonobject36.isNull("nix");
            String s62 = stringbuilder8.append(flag2).toString();
            printstream57.println(s62);
            PrintStream printstream58 = System.out;
            StringBuilder stringbuilder9 = (new StringBuilder()).append("   has: ");
            boolean flag3 = jsonobject36.has("nix");
            String s63 = stringbuilder9.append(flag3).toString();
            printstream58.println(s63);
            PrintStream printstream59 = System.out;
            String s64 = XML.toString(jsonobject36);
            printstream59.println(s64);
            PrintStream printstream60 = System.out;
            String s65 = HTTP.toString(jsonobject36);
            printstream60.println(s65);
            System.out.println("");
            JSONObject jsonobject37 = XML.toJSONObject("<?xml version='1.0' encoding='UTF-8'?>\n\n<SOAP-ENV:Envelope xmlns:SOAP-ENV=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:xsi=\"http://www.w3.org/1999/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/1999/XMLSchema\"><SOAP-ENV:Body><ns1:doGoogleSearch xmlns:ns1=\"urn:GoogleSearch\" SOAP-ENV:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\"><key xsi:type=\"xsd:string\">GOOGLEKEY</key> <q xsi:type=\"xsd:string\">'+search+'</q> <start xsi:type=\"xsd:int\">0</start> <maxResults xsi:type=\"xsd:int\">10</maxResults> <filter xsi:type=\"xsd:boolean\">true</filter> <restrict xsi:type=\"xsd:string\"></restrict> <safeSearch xsi:type=\"xsd:boolean\">false</safeSearch> <lr xsi:type=\"xsd:string\"></lr> <ie xsi:type=\"xsd:string\">latin1</ie> <oe xsi:type=\"xsd:string\">latin1</oe></ns1:doGoogleSearch></SOAP-ENV:Body></SOAP-ENV:Envelope>");
            PrintStream printstream61 = System.out;
            String s66 = jsonobject37.toString(2);
            printstream61.println(s66);
            PrintStream printstream62 = System.out;
            String s67 = XML.toString(jsonobject37);
            printstream62.println(s67);
            System.out.println("");
            JSONObject jsonobject38 = new JSONObject("{Envelope: {Body: {\"ns1:doGoogleSearch\": {oe: \"latin1\", filter: true, q: \"'+search+'\", key: \"GOOGLEKEY\", maxResults: 10, \"SOAP-ENV:encodingStyle\": \"http://schemas.xmlsoap.org/soap/encoding/\", start: 0, ie: \"latin1\", safeSearch:false, \"xmlns:ns1\": \"urn:GoogleSearch\"}}}}");
            PrintStream printstream63 = System.out;
            String s68 = jsonobject38.toString(2);
            printstream63.println(s68);
            PrintStream printstream64 = System.out;
            String s69 = XML.toString(jsonobject38);
            printstream64.println(s69);
            System.out.println("");
            JSONObject jsonobject39 = CookieList.toJSONObject("  f%oo = b+l=ah  ; o;n%40e = t.wo ");
            PrintStream printstream65 = System.out;
            String s70 = jsonobject39.toString(2);
            printstream65.println(s70);
            PrintStream printstream66 = System.out;
            String s71 = CookieList.toString(jsonobject39);
            printstream66.println(s71);
            System.out.println("");
            JSONObject jsonobject40 = Cookie.toJSONObject("f%oo=blah; secure ;expires = April 24, 2002");
            PrintStream printstream67 = System.out;
            String s72 = jsonobject40.toString(2);
            printstream67.println(s72);
            PrintStream printstream68 = System.out;
            String s73 = Cookie.toString(jsonobject40);
            printstream68.println(s73);
            System.out.println("");
            JSONObject jsonobject41 = new JSONObject("{script: 'It is not allowed in HTML to send a close script tag in a string<script>because it confuses browsers</script>so we insert a backslash before the /'}");
            PrintStream printstream69 = System.out;
            String s74 = jsonobject41.toString();
            printstream69.println(s74);
            System.out.println("");
            JSONTokener jsontokener = new JSONTokener("{op:'test', to:'session', pre:1}{op:'test', to:'session', pre:2}");
            JSONObject jsonobject42 = new JSONObject(jsontokener);
            PrintStream printstream70 = System.out;
            String s75 = jsonobject42.toString();
            printstream70.println(s75);
            PrintStream printstream71 = System.out;
            StringBuilder stringbuilder10 = (new StringBuilder()).append("pre: ");
            int j = jsonobject42.optInt("pre");
            String s76 = stringbuilder10.append(j).toString();
            printstream71.println(s76);
            char c = jsontokener.skipTo('{');
            System.out.println(c);
            JSONObject jsonobject43 = new JSONObject(jsontokener);
            PrintStream printstream72 = System.out;
            String s77 = jsonobject43.toString();
            printstream72.println(s77);
            System.out.println("");
            JSONArray jsonarray18 = CDL.toJSONArray("Comma delimited list test, '\"Strip\"Quotes', 'quote, comma', No quotes, 'Single Quotes', \"Double Quotes\"\n1,'2',\"3\"\n,'It is \"good,\"', \"It works.\"\n\n");
            String s78 = CDL.toString(jsonarray18);
            System.out.println(s78);
            System.out.println("");
            PrintStream printstream73 = System.out;
            String s79 = jsonarray18.toString(4);
            printstream73.println(s79);
            System.out.println("");
            JSONArray jsonarray19 = CDL.toJSONArray(s78);
            PrintStream printstream74 = System.out;
            String s80 = jsonarray19.toString(4);
            printstream74.println(s80);
            System.out.println("");
            Object obj3 = new JSONArray(" [\"<escape>\", next is an implied null , , ok,] ");
            PrintStream printstream75 = System.out;
            String s81 = ((JSONArray) (obj3)).toString();
            printstream75.println(s81);
            System.out.println("");
            PrintStream printstream76 = System.out;
            String s82 = XML.toString(obj3);
            printstream76.println(s82);
            System.out.println("");
            JSONObject jsonobject44 = new JSONObject("{ fun => with non-standard forms ; forgiving => This package can be used to parse formats that are similar to but not stricting conforming to JSON; why=To make it easier to migrate existing data to JSON,one = [[1.00]]; uno=[[{1=>1}]];'+':+6e66 ;pluses=+++;empty = '' , 'double':0.666,true: TRUE, false: FALSE, null=NULL;[true] = [[!,@;*]]; string=>  o. k. ; \r oct=0666; hex=0x666; dec=666; o=0999; noh=0x0x}");
            PrintStream printstream77 = System.out;
            String s83 = jsonobject44.toString(4);
            printstream77.println(s83);
            System.out.println("");
            if(jsonobject44.getBoolean("true") && !jsonobject44.getBoolean("false"))
                System.out.println("It's all good");
            System.out.println("");
            String args4[] = new String[4];
            args4[0] = "dec";
            args4[1] = "oct";
            args4[2] = "hex";
            args4[3] = "missing";
            JSONObject jsonobject45 = new JSONObject(jsonobject44, args4);
            PrintStream printstream78 = System.out;
            String s84 = jsonobject45.toString(4);
            printstream78.println(s84);
            System.out.println("");
            PrintStream printstream79 = System.out;
            JSONWriter jsonwriter32 = (new JSONStringer()).array().value(obj3).value(jsonobject45).endArray();
            printstream79.println(jsonwriter32);
            jsonobject44 = new JSONObject("{string: \"98.6\", long: 2147483648, int: 2147483647, longer: 9223372036854775807, double: 9223372036854775808}");
            PrintStream printstream80 = System.out;
            String s85 = jsonobject44.toString(4);
            printstream80.println(s85);
            System.out.println("\ngetInt");
            PrintStream printstream81 = System.out;
            StringBuilder stringbuilder11 = (new StringBuilder()).append("int    ");
            int k = jsonobject44.getInt("int");
            String s86 = stringbuilder11.append(k).toString();
            printstream81.println(s86);
            PrintStream printstream82 = System.out;
            StringBuilder stringbuilder12 = (new StringBuilder()).append("long   ");
            int l = jsonobject44.getInt("long");
            String s87 = stringbuilder12.append(l).toString();
            printstream82.println(s87);
            PrintStream printstream83 = System.out;
            StringBuilder stringbuilder13 = (new StringBuilder()).append("longer ");
            int i1 = jsonobject44.getInt("longer");
            String s88 = stringbuilder13.append(i1).toString();
            printstream83.println(s88);
            PrintStream printstream84 = System.out;
            StringBuilder stringbuilder14 = (new StringBuilder()).append("double ");
            int j1 = jsonobject44.getInt("double");
            String s89 = stringbuilder14.append(j1).toString();
            printstream84.println(s89);
            PrintStream printstream85 = System.out;
            StringBuilder stringbuilder15 = (new StringBuilder()).append("string ");
            int k1 = jsonobject44.getInt("string");
            String s90 = stringbuilder15.append(k1).toString();
            printstream85.println(s90);
            System.out.println("\ngetLong");
            PrintStream printstream86 = System.out;
            StringBuilder stringbuilder16 = (new StringBuilder()).append("int    ");
            long l1 = jsonobject44.getLong("int");
            String s91 = stringbuilder16.append(l1).toString();
            printstream86.println(s91);
            PrintStream printstream87 = System.out;
            StringBuilder stringbuilder17 = (new StringBuilder()).append("long   ");
            long l2 = jsonobject44.getLong("long");
            String s92 = stringbuilder17.append(l2).toString();
            printstream87.println(s92);
            PrintStream printstream88 = System.out;
            StringBuilder stringbuilder18 = (new StringBuilder()).append("longer ");
            long l3 = jsonobject44.getLong("longer");
            String s93 = stringbuilder18.append(l3).toString();
            printstream88.println(s93);
            PrintStream printstream89 = System.out;
            StringBuilder stringbuilder19 = (new StringBuilder()).append("double ");
            long l4 = jsonobject44.getLong("double");
            String s94 = stringbuilder19.append(l4).toString();
            printstream89.println(s94);
            PrintStream printstream90 = System.out;
            StringBuilder stringbuilder20 = (new StringBuilder()).append("string ");
            long l5 = jsonobject44.getLong("string");
            String s95 = stringbuilder20.append(l5).toString();
            printstream90.println(s95);
            System.out.println("\ngetDouble");
            PrintStream printstream91 = System.out;
            StringBuilder stringbuilder21 = (new StringBuilder()).append("int    ");
            double d1 = jsonobject44.getDouble("int");
            String s96 = stringbuilder21.append(d1).toString();
            printstream91.println(s96);
            PrintStream printstream92 = System.out;
            StringBuilder stringbuilder22 = (new StringBuilder()).append("long   ");
            double d2 = jsonobject44.getDouble("long");
            String s97 = stringbuilder22.append(d2).toString();
            printstream92.println(s97);
            PrintStream printstream93 = System.out;
            StringBuilder stringbuilder23 = (new StringBuilder()).append("longer ");
            double d3 = jsonobject44.getDouble("longer");
            String s98 = stringbuilder23.append(d3).toString();
            printstream93.println(s98);
            PrintStream printstream94 = System.out;
            StringBuilder stringbuilder24 = (new StringBuilder()).append("double ");
            double d4 = jsonobject44.getDouble("double");
            String s99 = stringbuilder24.append(d4).toString();
            printstream94.println(s99);
            PrintStream printstream95 = System.out;
            StringBuilder stringbuilder25 = (new StringBuilder()).append("string ");
            double d5 = jsonobject44.getDouble("string");
            String s100 = stringbuilder25.append(d5).toString();
            printstream95.println(s100);
            JSONObject jsonobject46 = jsonobject44.put("good sized", 0x7fffffffffffffffL);
            PrintStream printstream96 = System.out;
            String s101 = jsonobject44.toString(4);
            printstream96.println(s101);
            JSONArray jsonarray20 = new JSONArray("[2147483647, 2147483648, 9223372036854775807, 9223372036854775808]");
            PrintStream printstream97 = System.out;
            String s102 = jsonarray20.toString(4);
            printstream97.println(s102);
            System.out.println("\nKeys: ");
            obj3 = jsonobject44.keys();
            String s103 = s78;
            PrintStream printstream98;
            String s106;
            for(; ((Iterator) (obj3)).hasNext(); printstream98.println(s106))
            {
                String s104 = (String)((Iterator) (obj3)).next();
                printstream98 = System.out;
                StringBuilder stringbuilder26 = (new StringBuilder()).append(s104).append(": ");
                String s105 = jsonobject44.getString(s104);
                s106 = stringbuilder26.append(s105).toString();
            }

        }
        catch(Exception exception)
        {
            PrintStream printstream99 = System.out;
            String s107 = exception.toString();
            printstream99.println(s107);
            return;
        }
        Object obj;
        Object obj2;
        Object obj4;
        System.out.println("\naccumulate: ");
        JSONObject jsonobject47 = new JSONObject();
        JSONObject jsonobject48 = jsonobject47.accumulate("stooge", "Curly");
        JSONObject jsonobject49 = jsonobject47.accumulate("stooge", "Larry");
        JSONObject jsonobject50 = jsonobject47.accumulate("stooge", "Moe");
        JSONArray jsonarray21 = jsonobject47.getJSONArray("stooge").put(5, "Shemp");
        PrintStream printstream100 = System.out;
        String s108 = jsonobject47.toString(4);
        printstream100.println(s108);
        System.out.println("\nwrite:");
        PrintStream printstream101 = System.out;
        StringWriter stringwriter = new StringWriter();
        java.io.Writer writer = jsonobject47.write(stringwriter);
        printstream101.println(writer);
        JSONObject jsonobject51 = XML.toJSONObject("<xml empty><a></a><a>1</a><a>22</a><a>333</a></xml>");
        PrintStream printstream102 = System.out;
        String s109 = jsonobject51.toString(4);
        printstream102.println(s109);
        PrintStream printstream103 = System.out;
        String s110 = XML.toString(jsonobject51);
        printstream103.println(s110);
        JSONObject jsonobject52 = XML.toJSONObject("<book><chapter>Content of the first chapter</chapter><chapter>Content of the second chapter      <chapter>Content of the first subchapter</chapter>      <chapter>Content of the second subchapter</chapter></chapter><chapter>Third Chapter</chapter></book>");
        PrintStream printstream104 = System.out;
        String s111 = jsonobject52.toString(4);
        printstream104.println(s111);
        PrintStream printstream105 = System.out;
        String s112 = XML.toString(jsonobject52);
        printstream105.println(s112);
        JSONArray jsonarray22 = JSONML.toJSONArray("<book><chapter>Content of the first chapter</chapter><chapter>Content of the second chapter      <chapter>Content of the first subchapter</chapter>      <chapter>Content of the second subchapter</chapter></chapter><chapter>Third Chapter</chapter></book>");
        PrintStream printstream106 = System.out;
        String s113 = jsonarray22.toString(4);
        printstream106.println(s113);
        PrintStream printstream107 = System.out;
        String s114 = JSONML.toString(jsonarray22);
        printstream107.println(s114);
        JSONObject jsonobject53 = new JSONObject(null);
        JSONArray jsonarray23 = new JSONArray(null);
        JSONObject jsonobject54 = jsonobject53.append("stooge", "Joe DeRita");
        JSONObject jsonobject55 = jsonobject53.append("stooge", "Shemp");
        JSONObject jsonobject56 = jsonobject53.accumulate("stooges", "Curly");
        JSONObject jsonobject57 = jsonobject53.accumulate("stooges", "Larry");
        JSONObject jsonobject58 = jsonobject53.accumulate("stooges", "Moe");
        Object obj6 = jsonobject53.get("stooges");
        JSONObject jsonobject59 = jsonobject53.accumulate("stoogearray", obj6);
        JSONObject jsonobject60 = jsonobject53.put("map", null);
        JSONObject jsonobject61 = jsonobject53.put("collection", null);
        JSONObject jsonobject62 = jsonobject53.put("array", jsonarray23);
        JSONArray jsonarray24 = jsonarray23.put(null);
        JSONArray jsonarray25 = jsonarray23.put(null);
        PrintStream printstream108 = System.out;
        String s115 = jsonobject53.toString(4);
        printstream108.println(s115);
        JSONObject jsonobject63 = new JSONObject("{plist=Apple; AnimalSmells = { pig = piggish; lamb = lambish; worm = wormy; }; AnimalSounds = { pig = oink; lamb = baa; worm = baa;  Lisa = \"Why is the worm talking like a lamb?\" } ; AnimalColors = { pig = pink; lamb = black; worm = pink; } } ");
        PrintStream printstream109 = System.out;
        String s116 = jsonobject63.toString(4);
        printstream109.println(s116);
        obj4 = new JSONArray(" (\"San Francisco\", \"New York\", \"Seoul\", \"London\", \"Seattle\", \"Shanghai\")");
        PrintStream printstream110 = System.out;
        String s117 = ((JSONArray) (obj4)).toString();
        printstream110.println(s117);
        obj = XML.toJSONObject("<a ichi='1' ni='2'><b>The content of b</b> and <c san='3'>The content of c</c><d>do</d><e></e><d>re</d><f/><d>mi</d></a>");
        PrintStream printstream111 = System.out;
        String s118 = ((JSONObject) (obj)).toString(2);
        printstream111.println(s118);
        PrintStream printstream112 = System.out;
        String s119 = XML.toString(obj);
        printstream112.println(s119);
        System.out.println("");
        obj2 = JSONML.toJSONArray("<a ichi='1' ni='2'><b>The content of b</b> and <c san='3'>The content of c</c><d>do</d><e></e><d>re</d><f/><d>mi</d></a>");
        PrintStream printstream113 = System.out;
        String s120 = ((JSONArray) (obj2)).toString(4);
        printstream113.println(s120);
        PrintStream printstream114 = System.out;
        String s121 = JSONML.toString(((JSONArray) (obj2)));
        printstream114.println(s121);
        System.out.println("");
        System.out.println("\nTesting Exceptions: ");
        System.out.print("Exception: ");
        Object obj5 = new JSONArray();
        double d6 = (-1.0D / 0.0D);
        JSONArray jsonarray26 = ((JSONArray) (obj5)).put(d6);
        JSONArray jsonarray27 = ((JSONArray) (obj5)).put((0.0D / 0.0D));
        PrintStream printstream115 = System.out;
        String s122 = ((JSONArray) (obj5)).toString();
        printstream115.println(s122);
_L1:
        System.out.print("Exception: ");
        Object obj8;
        String s124;
        String s126;
        try
        {
            PrintStream printstream116 = System.out;
            double d7 = ((JSONObject) (obj)).getDouble("stooge");
            printstream116.println(d7);
        }
        catch(Exception exception1)
        {
            System.out.println(exception1);
        }
        System.out.print("Exception: ");
        try
        {
            PrintStream printstream117 = System.out;
            double d8 = ((JSONObject) (obj)).getDouble("howard");
            printstream117.println(d8);
        }
        catch(Exception exception2)
        {
            System.out.println(exception2);
        }
        System.out.print("Exception: ");
        try
        {
            PrintStream printstream118 = System.out;
            JSONObject jsonobject64 = ((JSONObject) (obj)).put(null, "howard");
            printstream118.println(jsonobject64);
        }
        catch(Exception exception3)
        {
            System.out.println(exception3);
        }
        System.out.print("Exception: ");
        try
        {
            PrintStream printstream119 = System.out;
            double d9 = ((JSONArray) (obj5)).getDouble(0);
            printstream119.println(d9);
        }
        catch(Exception exception4)
        {
            System.out.println(exception4);
        }
        System.out.print("Exception: ");
        try
        {
            PrintStream printstream120 = System.out;
            Object obj7 = ((JSONArray) (obj5)).get(-1);
            printstream120.println(obj7);
        }
        catch(Exception exception5)
        {
            System.out.println(exception5);
        }
        System.out.print("Exception: ");
        try
        {
            PrintStream printstream121 = System.out;
            JSONArray jsonarray28 = ((JSONArray) (obj5)).put((0.0D / 0.0D));
            printstream121.println(jsonarray28);
        }
        catch(Exception exception6)
        {
            System.out.println(exception6);
        }
        System.out.print("Exception: ");
        obj8 = XML.toJSONObject("<a><b>    ");
        obj = obj8;
_L2:
        System.out.print("Exception: ");
        obj8 = XML.toJSONObject("<a></b>    ");
        obj = obj8;
_L3:
        System.out.print("Exception: ");
        obj8 = XML.toJSONObject("<a></a    ");
        obj = obj8;
_L4:
        System.out.print("Exception: ");
        Object obj9 = new Object();
        obj4 = new JSONArray(obj9);
        PrintStream printstream122 = System.out;
        String s123 = ((JSONArray) (obj4)).toString();
        printstream122.println(s123);
        obj2 = obj4;
_L5:
        System.out.print("Exception: ");
        s124 = "[)";
        obj4 = new JSONArray(s124);
        PrintStream printstream123 = System.out;
        String s125 = ((JSONArray) (obj4)).toString();
        printstream123.println(s125);
        s126 = s124;
_L6:
        System.out.print("Exception: ");
        obj5 = "<xml";
        obj8 = JSONML.toJSONArray(((String) (obj5)));
        obj4 = obj8;
        PrintStream printstream124 = System.out;
        String s127 = ((JSONArray) (obj4)).toString(4);
        printstream124.println(s127);
_L7:
        System.out.print("Exception: ");
        Exception exception7;
        Exception exception8;
        Exception exception9;
        Exception exception10;
        try
        {
            obj5 = "<right></wrong>";
            obj4 = JSONML.toJSONArray(((String) (obj5)));
            PrintStream printstream125 = System.out;
            String s128 = ((JSONArray) (obj4)).toString(4);
            printstream125.println(s128);
        }
        catch(Exception exception11)
        {
            Object obj16 = obj5;
            Object obj17 = obj4;
            Exception exception12 = exception11;
            System.out.println(exception12);
            Object obj18 = obj17;
            Object obj19 = obj16;
        }
        System.out.print("Exception: ");
        obj5 = "{\"koda\": true, \"koda\": true}";
        obj4 = new JSONObject(((String) (obj5)));
        PrintStream printstream126 = System.out;
        String s129 = ((JSONObject) (obj4)).toString(4);
        printstream126.println(s129);
        obj = obj5;
_L8:
        System.out.print("Exception: ");
        obj5 = new JSONStringer();
        obj = ((JSONStringer) (obj5)).object().key("bosanda").value("MARIE HAA'S").key("bosanda").value("MARIE HAA\\'S").endObject().toString();
        PrintStream printstream127 = System.out;
        String s130 = ((JSONObject) (obj4)).toString(4);
        printstream127.println(s130);
        Object obj10 = obj5;
        Object obj11 = obj;
        return;
        obj5;
_L15:
        System.out.println(obj5);
        obj5 = obj4;
          goto _L1
        exception7;
        System.out.println(exception7);
          goto _L2
        exception8;
        System.out.println(exception8);
          goto _L3
        exception9;
        System.out.println(exception9);
          goto _L4
        obj4;
_L14:
        System.out.println(obj4);
          goto _L5
        exception10;
        Object obj12 = obj5;
        obj5 = exception10;
_L13:
        System.out.println(obj5);
        String s131 = s124;
          goto _L6
        obj4;
        Object obj13 = obj2;
        obj2 = obj5;
        obj5 = obj13;
_L12:
        System.out.println(obj4);
        Object obj14 = obj5;
        Object obj15 = obj2;
          goto _L7
        obj4;
        Object obj20 = obj5;
        obj5 = obj;
        obj = obj20;
_L11:
        System.out.println(obj4);
        obj4 = obj5;
          goto _L8
        obj4;
        obj5 = jsonstringer;
_L10:
        System.out.println(obj4);
        Object obj21 = obj5;
        Object obj22 = obj;
        return;
        obj4;
        if(true) goto _L10; else goto _L9
_L9:
        Exception exception13;
        exception13;
        obj = obj5;
        obj5 = obj4;
        obj4 = exception13;
          goto _L11
        Exception exception14;
        exception14;
        obj2 = obj5;
        obj5 = obj4;
        obj4 = exception14;
          goto _L12
        obj5;
          goto _L13
        Exception exception15;
        exception15;
        obj2 = obj4;
        obj4 = exception15;
          goto _L14
        Exception exception16;
        exception16;
        obj4 = obj5;
        obj5 = exception16;
          goto _L15
    }

    private class _cls1Obj
        implements JSONString
    {

        public String getBENT()
        {
            return "All uppercase key";
        }

        public double getNumber()
        {
            return aNumber;
        }

        public String getString()
        {
            return aString;
        }

        public String getX()
        {
            return "x";
        }

        public boolean isBoolean()
        {
            return aBoolean;
        }

        public String toJSONString()
        {
            StringBuilder stringbuilder = (new StringBuilder()).append("{");
            String s = JSONObject.quote(aString);
            StringBuilder stringbuilder1 = stringbuilder.append(s).append(":");
            String s1 = JSONObject.doubleToString(aNumber);
            return stringbuilder1.append(s1).append("}").toString();
        }

        public String toString()
        {
            StringBuilder stringbuilder = new StringBuilder();
            String s = getString();
            StringBuilder stringbuilder1 = stringbuilder.append(s).append(" ");
            double d = getNumber();
            StringBuilder stringbuilder2 = stringbuilder1.append(d).append(" ");
            boolean flag = isBoolean();
            StringBuilder stringbuilder3 = stringbuilder2.append(flag).append(".");
            String s1 = getBENT();
            StringBuilder stringbuilder4 = stringbuilder3.append(s1).append(" ");
            String s2 = getX();
            return stringbuilder4.append(s2).toString();
        }

        public boolean aBoolean;
        public double aNumber;
        public String aString;

        public _cls1Obj(String s, double d, boolean flag)
        {
            aString = s;
            aNumber = d;
            aBoolean = flag;
        }
    }

}
