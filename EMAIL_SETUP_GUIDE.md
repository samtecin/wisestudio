# WiseStudio Plan Selection Email Setup Guide

## Current Issue
The plan selection form submits successfully but you're not receiving email notifications.

## Solutions (Choose One)

### Solution 1: Enable Google Form Email Notifications (Easiest)

1. Go to your Google Form: https://docs.google.com/forms/d/1FAIpQLSdQjzLlKb_How0n25NHSRzcWARTTyjS21mBFtNkO9q3PFcsXQ
2. Click on the "Responses" tab
3. Click the three dots menu (⋮) in the top right
4. Select "Get email notifications for new responses"
5. You'll now receive an email for every form submission

**Advantages:**
- No code changes needed
- Uses existing form
- Plan selections are now clearly marked with "[PLAN SELECTION]" prefix and enhanced formatting

### Solution 2: Create a Dedicated Google Form (Recommended)

1. Create a new Google Form at https://forms.google.com
2. Add these fields:
   - Name (Short answer)
   - Email (Short answer)
   - Mobile (Short answer)
   - Selected Plan (Multiple choice: Starter, Pro, Plus)
   - Timestamp (Short answer)

3. Get the form's submission URL:
   - Click "Send" button
   - Click the link icon
   - Copy the form URL
   - Replace `/viewform` with `/formResponse` in the URL

4. Get field entry IDs:
   - Right-click on each field and "Inspect element"
   - Find the `name` attribute (e.g., `entry.1234567890`)

5. Update the code in index.html:
   - Replace `YOUR_NEW_FORM_ID_HERE` with your form ID
   - Replace entry IDs with your actual entry IDs

6. Enable email notifications for the new form

### Solution 3: Use EmailJS (Alternative Email Service)

1. Sign up at https://www.emailjs.com/ (free tier available)
2. Create an email service (Gmail, Outlook, etc.)
3. Create an email template with these variables:
   - {{from_name}}
   - {{from_email}}
   - {{from_mobile}}
   - {{selected_plan}}
   - {{timestamp}}

4. Get your:
   - Public Key
   - Service ID
   - Template ID

5. Update the code in index.html:
   - Uncomment the EmailJS section
   - Replace placeholder values with your actual keys
   - Replace `your-email@example.com` with your email

### Solution 4: Check Google Form Responses Manually

1. Go to your Google Form
2. Click "Responses" tab
3. You should see all submissions there
4. Plan selections are now clearly marked with "[PLAN SELECTION]" prefix

## Current Form Enhancement

The plan selection form now sends enhanced data including:
- Clear "[PLAN SELECTION]" identifier in the name field
- Formatted message with emojis and clear structure
- All relevant customer information
- Timestamp and source tracking

## Testing

1. Test the plan selection form on your website
2. Check if you receive notifications (depending on which solution you implemented)
3. Verify the data appears correctly in your chosen method

## Recommendation

Start with **Solution 1** (enable email notifications) as it requires no code changes and should work immediately. If you want better organization, proceed with **Solution 2** to create a dedicated form.
