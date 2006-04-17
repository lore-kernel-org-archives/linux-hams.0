From: Joop Stakenborg <pg4i@xs4all.nl>
Subject: Re: Any glfer users?
Date: Mon, 17 Apr 2006 07:29:27 +0200
Message-ID: <1145251767.16709.5.camel@localhost.localdomain>
References: <44427B4F.5010009@rochester.rr.com>
	 <190E15D0-BFED-42F9-9216-7E53F5E25366@att.net>
	 <4442C619.5030801@rochester.rr.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-HcxJxl7gBb8DLT6DIJGR"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4442C619.5030801@rochester.rr.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
To: Al Scanandoah <k2zn@rochester.rr.com>
Cc: Alex Flinsch <avflinsch@att.net>, linux-hams@vger.kernel.org


--=-HcxJxl7gBb8DLT6DIJGR
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Op zo, 16-04-2006 te 18:32 -0400, schreef Al Scanandoah:
> It looks like it may be getting closer, but still no cigar.  The error 
> messages have changed.

You can't compile glfer against version 2.0 of the GTK+ libraries. It is
an application written for version 1.2 of these libraries. In order to
get it working with GTK+-2.0 you need the attached patch.

I have sent this to the glfer author a while back, but he never replied
to my mail...

Regards,
Joop PG4I

--=-HcxJxl7gBb8DLT6DIJGR
Content-Disposition: attachment; filename=diff.gtk2.glfer
Content-Type: text/x-patch; name=diff.gtk2.glfer; charset=utf-8
Content-Transfer-Encoding: 7bit

diff -u -r glfer-0.3.4/g_about.c glfer-0.3.4gtk2/g_about.c
--- glfer-0.3.4/g_about.c	2004-08-23 21:20:45.000000000 +0200
+++ glfer-0.3.4gtk2/g_about.c	2005-08-20 19:55:06.000000000 +0200
@@ -464,7 +464,9 @@
 void show_license(GtkWidget * widget, gpointer data)
 {
   static GdkFont *font = NULL;
-  GtkWidget *bu, *hb, *te, *sb;
+  GtkWidget *bu, *hb, *te, *sw;
+  GtkTextBuffer *b;
+  GtkTextIter end;
 
   if (license_dialog && license_dialog->window) {
     gdk_window_show(license_dialog->window);
@@ -492,15 +494,15 @@
   gtk_box_pack_start(GTK_BOX(GTK_DIALOG(license_dialog)->vbox), hb, TRUE, TRUE, 0);
   gtk_widget_show(hb);
 
-  te = gtk_text_new(NULL, NULL);
+  sw = gtk_scrolled_window_new (NULL, NULL);
+  gtk_widget_show(sw);
+  te = gtk_text_view_new();
+  gtk_container_add (GTK_CONTAINER (sw), te);
   gtk_widget_set_usize(te, 81 * gdk_char_width(font, ' '), 400);
-  gtk_text_set_word_wrap(GTK_TEXT(te), FALSE);
+  gtk_text_view_set_wrap_mode (GTK_TEXT_VIEW (te), GTK_WRAP_WORD);
   gtk_box_pack_start(GTK_BOX(hb), te, TRUE, TRUE, 0);
   gtk_widget_show(te);
-
-  sb = gtk_vscrollbar_new(GTK_TEXT(te)->vadj);
-  gtk_box_pack_start(GTK_BOX(hb), sb, FALSE, FALSE, 0);
-  gtk_widget_show(sb);
+  gtk_box_pack_start(GTK_BOX(hb), sw, FALSE, FALSE, 0);
 
   bu = gtk_button_new_with_label("Ok");
   gtk_tooltips_set_tip(glfer.tt, bu, "Close window", NULL);
@@ -511,5 +513,7 @@
   gtk_widget_show(bu);
 
   gtk_widget_show(license_dialog);
-  gtk_text_insert(GTK_TEXT(te), font, NULL, NULL, gpl_text, strlen(gpl_text));
+  b = gtk_text_view_get_buffer (GTK_TEXT_VIEW (te));
+  gtk_text_buffer_get_end_iter (b, &end);
+  gtk_text_buffer_insert (b, &end, gpl_text, -1);
 }
diff -u -r glfer-0.3.4/g_main.c glfer-0.3.4gtk2/g_main.c
--- glfer-0.3.4/g_main.c	2004-09-01 18:52:40.000000000 +0200
+++ glfer-0.3.4gtk2/g_main.c	2005-08-20 19:46:06.000000000 +0200
@@ -148,7 +148,7 @@
     gtk_widget_set_sensitive(glfer.test_menu_item, FALSE);
   }
 
-  gtk_accel_group_attach(accel_group, GTK_OBJECT(window));
+  gtk_window_add_accel_group (GTK_WINDOW (window), accel_group);
 
   if (menu_bar)
     *menu_bar = gtk_item_factory_get_widget(item_factory, "<main>");
@@ -468,7 +468,7 @@
   D(printf("x_left = %f, y_top = %f, x_right = %f, y_bottom = %f\n", x_left, y_top, x_right, y_bottom));	/* for debug */
 
   if (event->button == 1) {
-    pixels = gdk_pixbuf_get_from_drawable(pixels, pixmap, gdk_rgb_get_cmap(), x_left, y_top, sel_width, sel_height);
+    pixels = mygdk_pixbuf_get_from_drawable(pixels, pixmap, gdk_rgb_get_cmap(), x_left, y_top, sel_width, sel_height);
     save_spect_dialog(widget, NULL);
   }
 }
@@ -1033,7 +1033,7 @@
   guchar *pixels = NULL;
   int quality = 75;
 
-  pixels = gdk_pixbuf_get_from_drawable(pixels, pixmap, gdk_rgb_get_cmap(), 0, 0, pixmap_width, pixmap_height);
+  pixels = mygdk_pixbuf_get_from_drawable(pixels, pixmap, gdk_rgb_get_cmap(), 0, 0, pixmap_width, pixmap_height);
   write_jpeg_file("glfer.jpg", quality, pixels, pixmap_width, pixmap_height);
 }
 
diff -u -r glfer-0.3.4/g_save_image.c glfer-0.3.4gtk2/g_save_image.c
--- glfer-0.3.4/g_save_image.c	2004-08-23 21:20:45.000000000 +0200
+++ glfer-0.3.4gtk2/g_save_image.c	2005-08-20 19:46:37.000000000 +0200
@@ -229,7 +229,8 @@
  * the latter case, NULL will be returned if not enough memory could be
  * allocated for the pixbuf to be created.
  **/
-guchar *gdk_pixbuf_get_from_drawable(guchar * dest, GdkDrawable * src, GdkColormap * cmap, int src_x, int src_y, int width, int height)
+
+guchar *mygdk_pixbuf_get_from_drawable(guchar * dest, GdkDrawable * src, GdkColormap * cmap, int src_x, int src_y, int width, int height)
 {
   GdkWindowType window_type;
   int src_width, src_height;
diff -u -r glfer-0.3.4/g_save_image.h glfer-0.3.4gtk2/g_save_image.h
--- glfer-0.3.4/g_save_image.h	2004-08-23 21:20:45.000000000 +0200
+++ glfer-0.3.4gtk2/g_save_image.h	2005-08-20 19:45:34.000000000 +0200
@@ -22,7 +22,7 @@
 
 #include <gtk/gtk.h>
 
-guchar *gdk_pixbuf_get_from_drawable(guchar * dest, GdkDrawable * src, GdkColormap * cmap, int src_x, int src_y, int width, int height);
+guchar *mygdk_pixbuf_get_from_drawable(guchar * dest, GdkDrawable * src, GdkColormap * cmap, int src_x, int src_y, int width, int height);
 
 int write_jpeg_file(char *filename, int quality, char *image_buffer, int image_height, int image_width);
 

--=-HcxJxl7gBb8DLT6DIJGR--

