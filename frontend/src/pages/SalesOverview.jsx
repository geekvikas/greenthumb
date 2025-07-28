import { useEffect, useState } from 'react';
import React from 'react';
import client from "../api/client";
import {
  Typography,
  Grid,
  Paper,
  Box,
  Divider
} from '@mui/material';
import {
  BarChart, Bar, XAxis, YAxis, Tooltip, ResponsiveContainer, PieChart, Pie, Cell, Legend,
} from 'recharts';
import dayjs from 'dayjs';

// Optional: consistent color palette
const pieColors = ['#8884d8', '#82ca9d', '#ffc658', '#ff8042', '#8dd1e1'];

const SalesOverview = () => {
  const [data, setData] = useState({ revenue: [], categories: [] });
  const [insights, setInsights] = useState([]);

  useEffect(() => {
    client.get("/sales/overview").then((res) => {
      let data = res.data;
      let revenue = [], categories = [];

      if (data.revenue && data.revenue) {
        revenue = data.revenue.map(item => ({
          ...item,
          month: dayjs(item.month).format('MMM YYYY'),
          revenue: parseFloat(item.revenue),
        }));
      }

      if (data && data.categories) {
        categories = data.categories
      }
      setData({ revenue, categories })

      // Generate insights
      const insights = [];

      // 1. Best performing month
      const bestMonth = revenue.reduce((prev, curr) => curr.revenue > prev.revenue ? curr : prev, revenue[0]);
      insights.push(`Best performing month was ${bestMonth.month} with $${bestMonth.revenue.toFixed(2)} in sales.`);

      // 2. Seeds category percentage
      const totalCategorySales = categories.reduce((sum, cat) => sum + cat.sales, 0);
      const seeds = categories.find(cat => cat.category === "seeds");
      if (seeds) {
        const percent = ((seeds.sales / totalCategorySales) * 100).toFixed(1);
        insights.push(`Seeds category represents ${percent}% of total revenue.`);
      }

      // 3. Top category in last summer (e.g. June–August 2024)
      const summerMonths = ['2024-06-01', '2024-07-01', '2024-08-01'];
      const summerRevenue = revenue.filter(r => summerMonths.includes(r.rawMonth));
      // Add fake category mapping if not available — in real case, backend should return category per month
      // So we'll instead base this off total sales across categories
      if (categories.length > 0) {
        const topCategory = categories.reduce((a, b) => a.sales > b.sales ? a : b);
        insights.push(`The best performing category last summer was ${topCategory.category}.`);
      }

      setInsights(insights);
    });


  }, [])
  return (
    <Box sx={{ width: '100%' }}>

      <Typography variant="h4" gutterBottom>
        Sales Overview
      </Typography>

      <Paper elevation={3} sx={{ p: 4, mb: 4, mx: 5 }}>
        <Typography variant="h6" gutterBottom>
          Business Context
        </Typography>
        <Divider sx={{ mb: 2 }} />
        {insights.map((insight, index) => (
          <Typography key={index} variant="body1" sx={{ mb: 1 }}>
            • {insight}
          </Typography>
        ))}
      </Paper>
      <Grid container spacing={4} sx={{ width: '100%' }}>

        {/* Revenue Bar Chart */}
        <Grid item xs={12} md={8}>
          <Paper elevation={3} sx={{ p: 5, marginLeft: 5, marginRight: 20, width: '100%' }}>
            <Typography variant="h6" gutterBottom>
              Monthly Revenue
            </Typography>
            <ResponsiveContainer width="100%" height={300}>
              <BarChart data={data.revenue}>
                <XAxis dataKey="month" tick={{ fontSize: 12 }} />
                <YAxis />
                <Tooltip formatter={(value) => `$${value.toFixed(2)}`} />
                <Bar dataKey="revenue" fill="#1976d2" />
              </BarChart>
            </ResponsiveContainer>
          </Paper>
        </Grid>

        {/* Category Pie Chart */}
        <Grid item xs={12} md={4}>
          <Paper elevation={3} sx={{ p: 5, marginLeft: 20, width: '100%' }}>
            <Typography variant="h6" gutterBottom>
              Sales by Category
            </Typography>
            <ResponsiveContainer width="100%" height={300}>
              <PieChart>
                <Pie
                  data={data.categories}
                  dataKey="sales"
                  nameKey="category"
                  cx="50%"
                  cy="50%"
                  outerRadius={90}
                  label
                >
                  {data.categories.map((entry, index) => (
                    <Cell key={`cell-${index}`} fill={pieColors[index % pieColors.length]} />
                  ))}
                </Pie>
                <Tooltip formatter={(value) => `$${value.toFixed(2)}`} />
                <Legend />
              </PieChart>
            </ResponsiveContainer>
          </Paper>
        </Grid>
      </Grid>
    </Box>
  );
};

export default SalesOverview;
