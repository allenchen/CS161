// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   NameMatcher.java

package com.nloko.android.syncmypix.namematcher;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import com.nloko.android.Log;
import com.nloko.android.Utils;
import com.nloko.android.syncmypix.PhoneContact;
import java.io.*;
import java.lang.ref.WeakReference;
import java.util.*;

public class NameMatcher
{

    public NameMatcher(Context context, InputStream inputstream, boolean flag)
        throws Exception
    {
        TreeMap treemap = new TreeMap();
        mFirstNames = treemap;
        TreeMap treemap1 = new TreeMap();
        mLastNames = treemap1;
        HashMap hashmap = new HashMap();
        mNickNames = hashmap;
        HashMap hashmap1 = new HashMap();
        mDiminutives = hashmap1;
        WeakReference weakreference = new WeakReference(context);
        mContext = weakreference;
        loadDiminutives(inputstream);
        loadPhoneContacts(flag);
    }

    private PhoneContact exactMatch(String s, boolean flag)
    {
        if(s != null) goto _L2; else goto _L1
_L1:
        PhoneContact phonecontact = null;
_L4:
        return phonecontact;
_L2:
label0:
        {
            String as[] = normalizeName(s).split(" ");
            if(flag)
                as = reverse(as);
            TreeMap treemap = mFirstNames;
            String s1 = as[0];
            ArrayList arraylist = (ArrayList)treemap.get(s1);
            if(arraylist == null)
                break label0;
            if(Log.debug)
            {
                StringBuilder stringbuilder = (new StringBuilder()).append("prefix match from ");
                String s2 = as[0];
                String s3 = stringbuilder.append(s2).append(" to ").toString();
                Log.d("NameMatcher", s3);
            }
            Iterator iterator = arraylist.iterator();
            PhoneContact phonecontact1;
            String s7;
            String s8;
            do
            {
                do
                {
                    if(!iterator.hasNext())
                        break label0;
                    phonecontact1 = (PhoneContact)iterator.next();
                    if(Log.debug)
                    {
                        StringBuilder stringbuilder1 = (new StringBuilder()).append("   ");
                        String s4 = phonecontact1.name;
                        String s5 = stringbuilder1.append(s4).toString();
                        Log.d("NameMatcher", s5);
                    }
                    String s6 = phonecontact1.name;
                    String as1[] = normalizeName(s6).split(" ");
                    int i = as1.length - 1;
                    s7 = as1[i];
                } while(s7 == null);
                int j = as.length - 1;
                s8 = as[j];
            } while(!s7.equals(s8));
            phonecontact = phonecontact1;
            continue; /* Loop/switch isn't completed */
        }
        if(!flag)
            phonecontact = exactMatch(s, true);
        else
            phonecontact = null;
        if(true) goto _L4; else goto _L3
_L3:
    }

    private int getWordCount(String s)
    {
        int i;
        if(s == null)
            i = 0;
        else
            i = s.split(" ").length;
        return i;
    }

    private void loadDiminutives(InputStream inputstream)
    {
        BufferedReader bufferedreader = null;
        BufferedReader bufferedreader1;
        InputStreamReader inputstreamreader = new InputStreamReader(inputstream, "UTF-8");
        bufferedreader1 = new BufferedReader(inputstreamreader, 8192);
_L14:
        String s = bufferedreader1.readLine();
        if(s == null) goto _L2; else goto _L1
_L1:
        Object obj;
        String as[];
        int i;
        obj = null;
        as = s.split(",");
        i = 0;
_L8:
        int j = as.length;
        if(i >= j) goto _L4; else goto _L3
_L3:
        Object obj1;
        HashMap hashmap = mDiminutives;
        String s1 = as[i];
        obj1 = hashmap.get(s1);
        if(obj1 == null) goto _L6; else goto _L5
_L5:
        obj = obj1;
_L4:
        Object obj2;
        if(obj != null)
            obj2 = obj;
        else
            obj2 = new Object();
        i = 0;
        do
        {
            int k = as.length;
            if(i >= k)
                continue; /* Loop/switch isn't completed */
            HashMap hashmap1 = mDiminutives;
            String s2 = as[i];
            Object obj3 = hashmap1.get(s2);
            if(obj3 != null && obj3 != obj2)
            {
                if(Log.debug)
                {
                    StringBuilder stringbuilder = (new StringBuilder()).append("THREE LINE CONFLICT  ").append(obj2).append(" ");
                    HashMap hashmap2 = mDiminutives;
                    String s3 = as[i];
                    Object obj4 = hashmap2.get(s3);
                    String s4 = stringbuilder.append(obj4).toString();
                    Log.d("NameMatcher", s4);
                }
            } else
            {
                HashMap hashmap3 = mDiminutives;
                String s5 = as[i];
                Object obj5 = hashmap3.put(s5, obj2);
            }
            i++;
        } while(true);
        continue; /* Loop/switch isn't completed */
_L6:
        i++;
        if(true) goto _L8; else goto _L7
_L7:
        Object obj6;
        obj6;
        bufferedreader = bufferedreader1;
_L12:
        ((UnsupportedEncodingException) (obj6)).printStackTrace();
        throw new Error(((Throwable) (obj6)));
        Exception exception;
        exception;
_L9:
        IOException ioexception;
        if(bufferedreader != null)
            try
            {
                bufferedreader.close();
            }
            catch(IOException ioexception1) { }
        throw exception;
_L2:
        if(bufferedreader1 == null)
            return;
        try
        {
            bufferedreader1.close();
            return;
        }
        // Misplaced declaration of an exception variable
        catch(IOException ioexception)
        {
            return;
        }
        obj6;
_L10:
        ((IOException) (obj6)).printStackTrace();
        throw new Error(((Throwable) (obj6)));
        exception;
        bufferedreader = bufferedreader1;
          goto _L9
        obj6;
        bufferedreader = bufferedreader1;
          goto _L10
        obj6;
        if(true) goto _L12; else goto _L11
_L11:
        if(true) goto _L14; else goto _L13
_L13:
    }

    private PhoneContact match(String s, boolean flag, boolean flag1)
    {
        if(s != null) goto _L2; else goto _L1
_L1:
        PhoneContact phonecontact = null;
_L4:
        return phonecontact;
_L2:
        String as[];
label0:
        {
            TreeSet treeset;
label1:
            {
label2:
                {
                    as = normalizeName(s).split(" ");
                    if(flag1)
                    {
                        NameMatcher namematcher = this;
                        String as1[] = as;
                        as = namematcher.reverse(as1);
                    }
                    if(Log.debug)
                    {
                        StringBuilder stringbuilder = (new StringBuilder()).append("Trying to match: ");
                        String as2[] = as;
                        char c = ' ';
                        String s1 = Utils.join(as2, c);
                        String s2 = stringbuilder.append(s1).toString();
                        Log.d("NameMatcher", s2);
                    }
                    treeset = JVM INSTR new #202 <Class TreeSet>;
                    String s3 = as[0];
                    TreeMap treemap = mFirstNames;
                    NameMatcher namematcher1 = this;
                    String s4 = s3;
                    TreeMap treemap1 = treemap;
                    ArrayList arraylist = namematcher1.prefixMatch(s4, treemap1);
                    TreeSet treeset1 = treeset;
                    ArrayList arraylist1 = arraylist;
                    treeset1.TreeSet(arraylist1);
                    if(treeset.size() > 0)
                    {
                        if(Log.debug)
                        {
                            StringBuilder stringbuilder1 = (new StringBuilder()).append("prefix match from ");
                            String s5 = as[0];
                            String s6 = stringbuilder1.append(s5).append(" to ").toString();
                            Log.d("NameMatcher", s6);
                        }
                        Iterator iterator = treeset.iterator();
                        do
                        {
                            if(!iterator.hasNext())
                                break;
                            PhoneContact phonecontact1 = (PhoneContact)iterator.next();
                            if(Log.debug)
                            {
                                StringBuilder stringbuilder2 = (new StringBuilder()).append("   ");
                                String s7 = phonecontact1.name;
                                String s8 = stringbuilder2.append(s7).toString();
                                Log.d("NameMatcher", s8);
                            }
                        } while(true);
                    }
                    String s9 = as[0];
                    NameMatcher namematcher2 = this;
                    String s10 = s9;
                    ArrayList arraylist2 = namematcher2.nicknameMatch(s10);
                    Iterator iterator2;
                    int j1;
                    int k1;
                    PhoneContact phonecontact3;
                    String s22;
                    String s23;
                    if(arraylist2 != null)
                    {
                        int i = arraylist2.size();
                        int j = 1;
                        if(i > j)
                        {
                            if(Log.debug)
                                Log.d("NameMatcher", "multiple nickname matches:");
                            Iterator iterator1 = arraylist2.iterator();
                            do
                            {
                                if(!iterator1.hasNext())
                                    break;
                                PhoneContact phonecontact2 = (PhoneContact)iterator1.next();
                                if(Log.debug)
                                {
                                    StringBuilder stringbuilder3 = (new StringBuilder()).append("   ");
                                    String s11 = phonecontact2.name;
                                    String s12 = stringbuilder3.append(s11).toString();
                                    Log.d("NameMatcher", s12);
                                }
                            } while(true);
                        } else
                        {
                            int k = arraylist2.size();
                            int l = 1;
                            if(k == l && Log.debug)
                            {
                                StringBuilder stringbuilder4 = (new StringBuilder()).append("nickname matched ");
                                String s13 = as[0];
                                StringBuilder stringbuilder5 = stringbuilder4.append(s13).append(" to ");
                                ArrayList arraylist3 = arraylist2;
                                int i1 = 0;
                                String s14 = ((PhoneContact)arraylist3.get(i1)).name;
                                String s15 = stringbuilder5.append(s14).toString();
                                Log.d("NameMatcher", s15);
                            }
                        }
                        boolean flag2 = treeset.addAll(arraylist2);
                    } else
                    if(Log.debug)
                        Log.d("NameMatcher", "no nickname matches");
                    if(treeset.size() <= 0)
                        break label0;
                    j1 = as.length;
                    k1 = 1;
                    if(j1 <= k1)
                        break label1;
                    iterator2 = treeset.iterator();
                    do
                    {
                        if(!iterator2.hasNext())
                            break label2;
                        phonecontact3 = (PhoneContact)iterator2.next();
                        String s16 = phonecontact3.name;
                        NameMatcher namematcher3 = this;
                        String s17 = s16;
                        String as3[] = namematcher3.normalizeName(s17).split(" ");
                        int l1 = as3.length - 1;
                        String s18 = as3[l1];
                        int i2 = as.length - 1;
                        String s19 = as[i2];
                        String s20 = s18;
                        String s21 = s19;
                        if(s20.startsWith(s21))
                            break;
                        int j2 = as.length - 1;
                        s22 = as[j2];
                        s23 = s18;
                    } while(!s22.startsWith(s23));
                    if(Log.debug)
                    {
                        StringBuilder stringbuilder6 = (new StringBuilder()).append("matched ");
                        String s24 = s;
                        StringBuilder stringbuilder7 = stringbuilder6.append(s24).append(" to ");
                        String s25 = phonecontact3.name;
                        String s26 = stringbuilder7.append(s25).toString();
                        Log.d("NameMatcher", s26);
                    }
                    phonecontact = phonecontact3;
                    continue; /* Loop/switch isn't completed */
                }
                if(Log.debug)
                    Log.d("NameMatcher", "all inexact first name matches violated last name constraints");
            }
            if(flag)
            {
                int k2 = treeset.size();
                int l2 = 1;
                if(k2 == l2)
                {
                    PhoneContact phonecontact4 = (PhoneContact)treeset.iterator().next();
                    String s27 = phonecontact4.name;
                    NameMatcher namematcher4 = this;
                    String s28 = s27;
                    int i3 = namematcher4.getWordCount(s28);
                    int j3 = 1;
                    if(i3 == j3)
                    {
                        if(Log.debug)
                        {
                            StringBuilder stringbuilder8 = (new StringBuilder()).append("only one possibility, matched ");
                            String s29 = s;
                            StringBuilder stringbuilder9 = stringbuilder8.append(s29).append(" to ");
                            String s30 = phonecontact4.name;
                            String s31 = stringbuilder9.append(s30).toString();
                            Log.d("NameMatcher", s31);
                        }
                        phonecontact = phonecontact4;
                        continue; /* Loop/switch isn't completed */
                    }
                } else
                {
                    TreeMap treemap2 = mFirstNames;
                    String s32 = as[0];
                    ArrayList arraylist4 = (ArrayList)treemap2.get(s32);
                    if(arraylist4 != null)
                    {
                        int k3 = arraylist4.size();
                        int l3 = 1;
                        if(k3 == l3)
                        {
                            ArrayList arraylist5 = arraylist4;
                            int i4 = 0;
                            String s33 = ((PhoneContact)arraylist5.get(i4)).name;
                            NameMatcher namematcher5 = this;
                            String s34 = s33;
                            int j4 = namematcher5.getWordCount(s34);
                            int k4 = 1;
                            if(j4 == k4)
                            {
                                if(Log.debug)
                                {
                                    StringBuilder stringbuilder10 = (new StringBuilder()).append("exact first name match ");
                                    String s35 = as[0];
                                    StringBuilder stringbuilder11 = stringbuilder10.append(s35).append(" to ");
                                    ArrayList arraylist6 = arraylist4;
                                    int l4 = 0;
                                    String s36 = ((PhoneContact)arraylist6.get(l4)).name;
                                    String s37 = stringbuilder11.append(s36).toString();
                                    Log.d("NameMatcher", s37);
                                }
                                ArrayList arraylist7 = arraylist4;
                                int i5 = 0;
                                phonecontact = (PhoneContact)arraylist7.get(i5);
                                continue; /* Loop/switch isn't completed */
                            }
                        }
                    }
                    if(Log.debug)
                        Log.d("NameMatcher", "first name matched multiple people and there is no disambiguating last name");
                }
            }
        }
        int j5 = as.length;
        int k5 = 1;
        if(j5 == k5)
        {
            TreeMap treemap3 = mLastNames;
            String s38 = as[0];
            ArrayList arraylist8 = (ArrayList)treemap3.get(s38);
            if(arraylist8 != null)
            {
                int l5 = arraylist8.size();
                int i6 = 1;
                if(l5 == i6)
                {
                    if(Log.debug)
                    {
                        StringBuilder stringbuilder12 = (new StringBuilder()).append("exact last name match: ");
                        ArrayList arraylist9 = arraylist8;
                        int j6 = 0;
                        String s39 = ((PhoneContact)arraylist9.get(j6)).name;
                        String s40 = stringbuilder12.append(s39).toString();
                        Log.d("NameMatcher", s40);
                    }
                    phonecontact = (PhoneContact)arraylist8.get(0);
                    continue; /* Loop/switch isn't completed */
                }
            }
        } else
        if(!flag1)
        {
            NameMatcher namematcher6 = this;
            String s41 = s;
            boolean flag3 = flag;
            boolean flag4 = true;
            phonecontact = namematcher6.match(s41, flag3, flag4);
            continue; /* Loop/switch isn't completed */
        }
        if(Log.debug)
        {
            StringBuilder stringbuilder13 = (new StringBuilder()).append("No match found for ");
            String s42 = s;
            String s43 = stringbuilder13.append(s42).toString();
            Log.d("NameMatcher", s43);
        }
        phonecontact = null;
        if(true) goto _L4; else goto _L3
_L3:
    }

    private ArrayList nicknameMatch(String s)
    {
        ArrayList arraylist;
        if(s == null)
        {
            arraylist = null;
        } else
        {
            Object obj = mDiminutives.get(s);
            if(obj == null)
                arraylist = null;
            else
                arraylist = (ArrayList)mNickNames.get(obj);
        }
        return arraylist;
    }

    private String normalizeName(String s)
    {
        String s1;
        if(s == null)
        {
            s1 = null;
        } else
        {
            String s2 = s.toLowerCase().trim();
            StringBuffer stringbuffer = new StringBuffer(s2);
            int i = 0;
            int j = stringbuffer.length();
            for(int k = 0; k < j; k++)
            {
                char c = stringbuffer.charAt(k);
                int l = "\u0160\u017D\u0161\u017E\u0178\300\301\302\303\304\305\307\310\311\312\313\314\315\316\317\320\321\322\323\324\325\326\331\332\333\334\335\340\341\342\343\344\345\347\350\351\352\353\354\355\356\357\360\361\362\363\364\365\366\371\372\373\374\375\377".indexOf(c);
                if(l > -1)
                {
                    char c1 = "SZszYAAAAAACEEEEIIIIDNOOOOOUUUUYaaaaaaceeeeiiiidnooooouuuuyy ".charAt(l);
                    stringbuffer.setCharAt(k, c1);
                }
                if(c == '(')
                    i++;
                if(i <= 0)
                {
                    int i1 = j - 1;
                    if((k == i1 || c != '-') && (c != ' ' || k != 0))
                    {
                        if(c != ' ' || k <= 0)
                            continue;
                        int j1 = k - 1;
                        if(stringbuffer.charAt(j1) != ' ')
                            continue;
                    }
                }
                if(c == ')')
                    i--;
                StringBuffer stringbuffer1 = stringbuffer.deleteCharAt(k);
                j--;
                k--;
            }

            s1 = stringbuffer.toString();
        }
        return s1;
    }

    private ArrayList prefixMatch(String s, TreeMap treemap)
    {
        ArrayList arraylist = new ArrayList(3);
        if(treemap != null && s != null && s.length() != 0)
        {
            String s1 = s;
            StringBuffer stringbuffer = new StringBuffer(s1);
            int i = s1.length() - 1;
            int j = s1.length() - 1;
            char c = (char)(s1.charAt(j) + 1);
            stringbuffer.setCharAt(i, c);
            String s2 = stringbuffer.toString();
            SortedMap sortedmap = treemap.subMap(s1, s2);
            Iterator iterator = sortedmap.keySet().iterator();
            while(iterator.hasNext()) 
            {
                String s3 = (String)iterator.next();
                if(s3.startsWith(s))
                {
                    Collection collection = (Collection)sortedmap.get(s3);
                    boolean flag = arraylist.addAll(collection);
                } else
                if(Log.debug)
                {
                    String s4 = (new StringBuilder()).append("unexpected: ").append(s3).append(", ").append(s).toString();
                    Log.d("NameMatcher", s4);
                }
            }
        }
        return arraylist;
    }

    private String[] reverse(String as[])
    {
        String as1[] = new String[as.length];
        int i = 0;
        do
        {
            int j = as.length;
            if(i < j)
            {
                int k = as.length - 1 - i;
                String s = as[k];
                as1[i] = s;
                i++;
            } else
            {
                return as1;
            }
        } while(true);
    }

    protected PhoneContact createFromCursor(Cursor cursor)
    {
        PhoneContact phonecontact;
        if(cursor == null || cursor.isClosed())
        {
            phonecontact = null;
        } else
        {
            int i = cursor.getColumnIndex("_id");
            String s = cursor.getString(i);
            int j = cursor.getColumnIndex("name");
            String s1 = cursor.getString(j);
            if(Log.debug)
            {
                String s2 = (new StringBuilder()).append("NameMatcher is processing contact ").append(s1).toString();
                Log.d("NameMatcher", s2);
            }
            phonecontact = new PhoneContact(s, s1);
        }
        return phonecontact;
    }

    public void destroy()
    {
        if(mFirstNames != null)
            mFirstNames.clear();
        if(mLastNames != null)
            mLastNames.clear();
        if(mNickNames != null)
            mNickNames.clear();
        if(mDiminutives == null)
        {
            return;
        } else
        {
            mDiminutives.clear();
            return;
        }
    }

    protected Cursor doQuery(boolean flag)
    {
        Context context = (Context)mContext.get();
        Cursor cursor;
        if(context == null)
        {
            cursor = null;
        } else
        {
            String s = "";
            if(flag)
                s = "primary_phone IS NOT NULL";
            ContentResolver contentresolver = context.getContentResolver();
            android.net.Uri uri = android.provider.Contacts.People.CONTENT_URI;
            String as[] = new String[3];
            as[0] = "_id";
            as[1] = "name";
            as[2] = "primary_phone";
            String s1 = null;
            cursor = contentresolver.query(uri, as, s, null, s1);
        }
        return cursor;
    }

    public void dump()
    {
        for(Iterator iterator = mFirstNames.keySet().iterator(); iterator.hasNext();)
        {
            String s = (String)iterator.next();
            if(Log.debug)
            {
                Object aobj[] = new Object[1];
                aobj[0] = s;
                String s1 = String.format("First name:%s", aobj);
                Log.d("NameMatcher", s1);
            }
            Iterator iterator1 = ((ArrayList)mFirstNames.get(s)).iterator();
            while(iterator1.hasNext()) 
            {
                PhoneContact phonecontact = (PhoneContact)iterator1.next();
                if(Log.debug)
                {
                    Object aobj1[] = new Object[1];
                    String s2 = phonecontact.name;
                    aobj1[0] = s2;
                    String s3 = String.format("Phone Contact:%s", aobj1);
                    Log.d("NameMatcher", s3);
                }
            }
        }

        for(Iterator iterator2 = mLastNames.keySet().iterator(); iterator2.hasNext();)
        {
            String s4 = (String)iterator2.next();
            if(Log.debug)
            {
                Object aobj2[] = new Object[1];
                aobj2[0] = s4;
                String s5 = String.format("Last name:%s", aobj2);
                Log.d("NameMatcher", s5);
            }
            Iterator iterator3 = ((ArrayList)mLastNames.get(s4)).iterator();
            while(iterator3.hasNext()) 
            {
                PhoneContact phonecontact1 = (PhoneContact)iterator3.next();
                if(Log.debug)
                {
                    Object aobj3[] = new Object[1];
                    String s6 = phonecontact1.name;
                    aobj3[0] = s6;
                    String s7 = String.format("Phone Contact:%s", aobj3);
                    Log.d("NameMatcher", s7);
                }
            }
        }

        Iterator iterator4 = mNickNames.keySet().iterator();
        do
        {
            if(!iterator4.hasNext())
                return;
            Object obj = iterator4.next();
            if(Log.debug)
            {
                Object aobj4[] = new Object[1];
                aobj4[0] = obj;
                String s8 = String.format("Nick name:%s", aobj4);
                Log.d("NameMatcher", s8);
            }
            Iterator iterator5 = ((ArrayList)mNickNames.get(obj)).iterator();
            while(iterator5.hasNext()) 
            {
                PhoneContact phonecontact2 = (PhoneContact)iterator5.next();
                if(Log.debug)
                {
                    Object aobj5[] = new Object[1];
                    String s9 = phonecontact2.name;
                    aobj5[0] = s9;
                    String s10 = String.format("Phone Contact:%s", aobj5);
                    Log.d("NameMatcher", s10);
                }
            }
        } while(true);
    }

    public final PhoneContact exactMatch(String s)
    {
        return exactMatch(s, false);
    }

    protected void loadPhoneContacts(boolean flag)
    {
        Cursor cursor = doQuery(flag);
        if(cursor == null)
            return;
        do
        {
            if(!cursor.moveToNext())
                break;
            PhoneContact phonecontact = createFromCursor(cursor);
            if(phonecontact != null)
            {
                String s = phonecontact.name;
                String s1 = normalizeName(s);
                if(s1 != null)
                {
                    String as[] = s1.split(" ");
                    String s2 = as[0];
                    int i = as.length - 1;
                    String s3 = as[i];
                    if(mFirstNames.get(s2) == null)
                    {
                        TreeMap treemap = mFirstNames;
                        ArrayList arraylist = new ArrayList(3);
                        Object obj = treemap.put(s2, arraylist);
                    }
                    boolean flag1 = ((ArrayList)mFirstNames.get(s2)).add(phonecontact);
                    if(Log.debug)
                    {
                        StringBuilder stringbuilder = (new StringBuilder()).append("added ").append(s2).append(" to mFirstNames = ");
                        String s4 = phonecontact.name;
                        String s5 = stringbuilder.append(s4).toString();
                        Log.d("NameMatcher", s5);
                    }
                    if(mLastNames.get(s3) == null)
                    {
                        TreeMap treemap1 = mLastNames;
                        ArrayList arraylist1 = new ArrayList(3);
                        Object obj1 = treemap1.put(s3, arraylist1);
                    }
                    boolean flag2 = ((ArrayList)mLastNames.get(s3)).add(phonecontact);
                    Object obj2 = mDiminutives.get(s2);
                    if(obj2 != null)
                    {
                        if(mNickNames.get(obj2) == null)
                        {
                            HashMap hashmap = mNickNames;
                            ArrayList arraylist2 = new ArrayList(3);
                            Object obj3 = hashmap.put(obj2, arraylist2);
                        }
                        if(Log.debug)
                        {
                            StringBuilder stringbuilder1 = (new StringBuilder()).append("linking ").append(obj2).append(" with ");
                            String s6 = phonecontact.name;
                            String s7 = stringbuilder1.append(s6).toString();
                            Log.d("NameMatcher", s7);
                        }
                        boolean flag3 = ((ArrayList)mNickNames.get(obj2)).add(phonecontact);
                    }
                }
            }
        } while(true);
        cursor.close();
    }

    public final PhoneContact match(String s, boolean flag)
    {
        return match(s, flag, false);
    }

    protected final String TAG = "NameMatcher";
    protected final String mBadChars = "\u0160\u017D\u0161\u017E\u0178\300\301\302\303\304\305\307\310\311\312\313\314\315\316\317\320\321\322\323\324\325\326\331\332\333\334\335\340\341\342\343\344\345\347\350\351\352\353\354\355\356\357\360\361\362\363\364\365\366\371\372\373\374\375\377";
    protected final WeakReference mContext;
    private final HashMap mDiminutives;
    private final TreeMap mFirstNames;
    protected final String mGoodChars = "SZszYAAAAAACEEEEIIIIDNOOOOOUUUUYaaaaaaceeeeiiiidnooooouuuuyy ";
    private final TreeMap mLastNames;
    private final HashMap mNickNames;
}
